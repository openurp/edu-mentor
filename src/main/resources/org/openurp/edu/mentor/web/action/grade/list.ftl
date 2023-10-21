[#ftl]
[@b.head/]
[@b.grid items=courseGrades var="courseGrade" ]
  [@b.gridbar]
    bar.addItem("${b.text('action.export')}",action.exportData("semester.code:学年学期,std.code:学号,"+
                "std.name:姓名,std.state.squad.name:班级,crn:课程序号,course.code:课程代码,"+
                "course.name:课程名称,score:成绩,courseType.name:课程类别,courseTakeType.name:修读类别",null,'fileName=学生成绩'));
  [/@]
  [@b.row]
    [@b.boxcol/]
    [@b.col property="std.code" title="学号" width="8%"/]
    [@b.col property="std.name" title="姓名" width="10%"]
      <div title="${courseGrade.std.name}" class="text-ellipsis">
        [@b.a target="_blank" href="!student?student.id=${courseGrade.std.id}&project.id=${project.id}"]${courseGrade.std.name}[/@]
      </div>
    [/@]
    [@b.col property="std.state.squad.name" title="班级" width="13%"/]
    [@b.col property="crn" title="课程序号" width="6%"/]
    [@b.col property="course.code" title="课程代码" width="10%"/]
    [@b.col property="course.name" title="课程名称"]
      [@b.a href="!search?courseGrade.course.id="+courseGrade.course.id+"&project.id="+project.id]${courseGrade.course.name}[/@]
    [/@]
    [@b.col property="courseType.name" title="课程类型" width="14%"/]
    [@b.col property="score" title="成绩" width="5%"][#if courseGrade.passed]${(courseGrade.scoreText)?if_exists}[#else]<font color="red">${(courseGrade.scoreText)?if_exists}</font>[/#if][/@]
    [@b.col property="credits" title="学分" width="5%"/]
    [@b.col title="学年学期" width="8%"]${courseGrade.semester.schoolYear}&nbsp;${courseGrade.semester.name}[/@]
  [/@]
[/@]
[@b.foot/]
