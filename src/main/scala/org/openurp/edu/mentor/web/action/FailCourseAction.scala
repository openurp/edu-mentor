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
import org.beangle.webmvc.view.View
import org.beangle.webmvc.support.action.{EntityAction, ExportSupport}
import org.openurp.base.hr.model.Mentor
import org.openurp.base.model.Project
import org.openurp.edu.grade.model.AuditCourseResult
import org.openurp.starter.web.support.MentorSupport
import org.openurp.std.graduation.model.GraduateResult
import org.openurp.std.graduation.service.GraduateService

import java.time.LocalDate

/** 查询统计未通过的课程审核结果
 */
class FailCourseAction extends MentorSupport, EntityAction[AuditCourseResult], ExportSupport[AuditCourseResult] {

  var graduateService: GraduateService = _

  protected override def projectIndex(mentor: Mentor)(using project: Project): View = {
    given project: Project = getProject

    put("project", project)
    put("batches", graduateService.getBatches(project))
    forward()
  }

  def search(): View = {
    put("results", entityDao.search(getQueryBuilder))
    forward()
  }

  protected override def getQueryBuilder: OqlBuilder[AuditCourseResult] = {
    val mentor = getMentor
    val project = getProject
    val builder = super.getQueryBuilder
    builder.where("result.passed = false")
    builder.where("result.groupResult.passed = false")
    builder.where("result.groupResult.planResult.std.project=:project", project)
    builder.where("result.groupResult.planResult.std.state.squad.mentor=:mentor or result.groupResult.planResult.std.state.squad.master=:master", mentor.staff, mentor.staff)
    getBoolean("stdActive") foreach { active =>
      val nowAt = LocalDate.now
      if (active) builder.where("result.groupResult.planResult.std.beginOn <= :now and result.groupResult.planResult.std.endOn >= :now and result.groupResult.planResult.std.registed = true  and result.groupResult.planResult.std.state.inschool=true", nowAt)
      else builder.where("result.groupResult.planResult.std.beginOn > :now or result.groupResult.planResult.std.endOn < :now or result.groupResult.planResult.std.registed=false or result.groupResult.planResult.std.state.inschool=false", nowAt)
    }
    getLong("batch.id") foreach { batchId =>
      builder.where(s"exists(from ${classOf[GraduateResult].getName} gr where gr.std=result.groupResult.planResult.std and gr.batch.id=:batchId)", batchId)
    }
    builder
  }

  override def simpleEntityName: String = "result"

}
