/*
 * Copyright (C) 2014, The OpenURP Software.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package org.openurp.edu.mentor.web.action

import org.beangle.data.dao.OqlBuilder
import org.beangle.web.action.context.ActionContext
import org.beangle.web.action.support.ParamSupport
import org.beangle.web.action.view.View
import org.beangle.web.servlet.util.RequestUtils
import org.beangle.webmvc.support.action.{EntityAction, ExportSupport}
import org.beangle.webmvc.support.helper.QueryHelper
import org.openurp.base.model.Project
import org.openurp.base.std.model.{Mentor, Student}
import org.openurp.edu.grade.model.{CourseGrade, Grade}
import org.openurp.starter.web.support.MentorSupport

/** 成绩查询
 *
 */
class GradeAction extends MentorSupport, EntityAction[CourseGrade], ParamSupport, ExportSupport[CourseGrade] {

  protected override def projectIndex(mentor: Mentor)(using project: Project): View = {
    null
  }

  def search(): View = {
    val project = getProject
    put("project", project)
    put("courseGrades", entityDao.search(getQueryBuilder))
    forward()
  }

  protected override def getQueryBuilder: OqlBuilder[CourseGrade] = {
    val mentor = getMentor
    val project = getProject
    val query = OqlBuilder.from(classOf[CourseGrade], "courseGrade")
    query.where("courseGrade.std.state.squad.mentor=:mentor", mentor.staff)
    query.where("courseGrade.std.project=:project", project)
    query.where("courseGrade.status=:published", Grade.Status.Published)
    QueryHelper.populate(query)

    getInt("isPass") foreach {
      case 0 => query.where("courseGrade.passed = false")
      case 1 => query.where("courseGrade.passed = true")
      case 3 =>
        val hql = "courseGrade.passed = false and not exists(from " + classOf[CourseGrade].getName +
          " cg where cg.std = courseGrade.std and cg.course = courseGrade.course and cg.passed = true)"
        query.where(hql)
    }
    query.limit(QueryHelper.pageLimit)
    query
  }

  def student(): View = {
    val student = entityDao.get(classOf[Student], getLongId("student"))
    val query = getQueryBuilder
    query.limit(null)
    query.where("courseGrade.std=:std", student)
    val courseGrades = entityDao.search(query)
    put("courseGrades", courseGrades)
    put("std", student)
    forward()
  }
}
