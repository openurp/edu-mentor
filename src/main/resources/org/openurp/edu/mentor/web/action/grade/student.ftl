[#ftl]
[@b.head/]
[@b.toolbar title="${std.name}的成绩查询"]
[/@]
<div class="container">
  <table width="100%" class="infoTable">
    <tr>
     <td class="title">学号</td><td>${((std.code)?default(""))?trim}</td>
     <td class="title">姓名</td><td>${std.name}</td>
     <td class="title">性别</td><td>${((std.gender.name)?default(""))?trim}</td>
     <td class="title">学习形式</td><td>${std.studyType.name}</td>
     <td class="title">培养类型</td><td>${std.eduType.name}</td>
     <td class="title">培养层次</td><td>${std.level.name}</td>
    </tr>
    <tr>
      <td class="title">年级</td><td>${std.state.grade.name}</td>
      <td class="title">院系</td><td>${std.state.department.name}</td>
      <td class="title">专业、方向</td><td colspan="2">${(std.state.major.name)?default("")} ${(std.state.direction.name)!}</td>
      <td class="title">班级</td><td colspan="2">${(std.state.squad.name)!}</td>
    [#if std.tutor??]
      <td class="title">导师</td><td>${(std.tutor.name)!}</td>
    [#else]
      <td class="title">辅导员</td><td>${(std.state.squad.mentor.name)!}</td>
    [/#if]
    </tr>
  </table>

  [#assign semesterNames={'1':'第一学期','2':'第二学期'}]
  [@b.grid items=courseGrades var="grade" filterable="false"  class="border-1px border-blue"]
    [@b.row]
      [@b.col width="4%" title="序号"]${grade_index+1}[/@]
      [@b.col width="180px" title="学年学期"]${grade.semester.schoolYear}学年 ${semesterNames[grade.semester.name]!grade.semester.name}[/@]
      [@b.col title="课程名称"]${grade.course.name}[/@]

      [@b.col width="5%" title="学分"]${(grade.course.getCredits(grade.std.level))!}[/@]
      [@b.col title="修读类别" width="8%"]
        [#if grade.courseTakeType?? && grade.courseTakeType.id !=1]
        <span style="color:red;">${grade.courseTakeType.name}</span>
        [#else]
        ${grade.courseTakeType.name}
        [/#if]
        [#if grade.freeListening]<sup>免听</sup>[/#if][#t/]
      [/@]
      [#if grade?exists]
      [#assign style][#if grade.published]${grade.passed?string("","color:red")}[/#if][/#assign]
      [@b.col width="12%" title="成绩"][#if grade.published]${grade.scoreText!"--"}[#else]${b.text('grade.notPublished')}[/#if][/@]
      [/#if]
    [/@]
  [/@]
  <br>
</div>
[@b.foot/]
