[#ftl]
[@b.head/]
[@b.toolbar title="学生成绩查询"]
[/@]
<div class="search-container">
  <div class="search-panel">
      [@b.form name="stdGradeSearchForm" action="!search" title="查询条件" target="contentDiv" theme="search"]
        <input type="hidden" name="project.id" value="${project.id}"/>
        <input type="hidden" name="orderBy" value="courseGrade.semester.beginOn desc"/>
        [@b.textfields names="courseGrade.std.code;学号,courseGrade.std.name;姓名,courseGrade.std.state.squad.name;班级名称,courseGrade.std.state.grade.code;就读年级,courseGrade.crn;课程序号,courseGrade.course.code;课程代码,courseGrade.course.name;课程名称,courseGrade.courseType.name;课程类型"/]
        [@b.select label="是否通过" name="isPass" id="isPass" items={'1':'通过','0':'未通过','3','一直未通过'} empty="全部" /]
      [/@]
  </div>
  <div class="search-list">
   [@b.div id="contentDiv" href="!search?project.id="+project.id /]
  </div>
</div>
[@b.foot/]
