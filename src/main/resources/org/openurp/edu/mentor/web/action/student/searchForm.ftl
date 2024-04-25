[#assign id="s"]
[#assign statuses={'active':'在籍在校','unactive':'在籍不在校','available':'在籍','unavailable':'不在籍','active_unregisted':'不在籍在校'}/]
[#assign fields={'student.state.campus.name':'校区',
                 'contact.mobile':'移动电话'
                 }/]
[@b.form name="studentSearchForm" id="studentSearchForm" action="!search" title="ui.searchForm" target="studentList" theme="search"]
  <input type="hidden" name="project.id" value="${project.id}"/>
  [@b.textfield name="student.code" label="学号"/]
  [@b.textfield name="student.name" label="姓名"/]
  [@b.textfield name="student.state.grade.code" label="年级"/]
  [@b.select name="student.level.id" label="培养层次" items=levels empty="..."/]
  [@b.select name="student.state.department.id" label="院系" items=departments empty="..."/]
  [@b.select name="student.state.major.id" label="专业" items=majors empty="..."/]
  [@b.select name="student.stdType.id" label="学生类别" items=stdTypes empty="..."/]
  [@b.textfield name="student.duration" label="学制" onKeyup="validateData(this);"/]
  [#if tutorSupported][@b.textfield name="student.tutor.name" label="导师"/][/#if]
  [@b.select name="status" label="状态" items=statuses empty="..." value="active"/]
  [@b.select name="student.state.status.id" label="学籍状态" items=states?sort_by("name") empty="..."/]
  [@b.textfield name="student.state.squad.name" label="班级"/]
  <div class="search-item">
    <select onchange="document.getElementById('custom_field').name=this.value" style="width:50px">
      <option value=""></option>
      [#list fields as k,v]
      <option value="${k}">${v}</option>
      [/#list]
    </select>
    <input type="text" id="custom_field" name="" maxlength="100" value="">
  </div>
[/@]
<script>
  function validateData(obj) {
    var numObj = Number(obj.value);
    if (isNaN(numObj)) {
      obj.value = '';
    }
  }
    $(document).ready(function() {
      bg.form.submit("studentSearchForm");
    });
  </script>
