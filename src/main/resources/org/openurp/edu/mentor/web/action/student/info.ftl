[#ftl]
[@b.head/]
[@b.toolbar title='学生信息查看']
  bar.addBackOrClose();
[/@]
<div class="container text-sm">
[#macro panel title]
<div class="card card-primary card-outline">
  <div class="card-header">
    <h3 class="card-title">${title}</h3>
  </div>
  [#nested/]
</div>
[/#macro]

<div class="card card-primary card-outline">
  <div class="card-header">
    <h3 class="card-title">学籍信息</h3>
  </div>
  [#include "components/student_info.ftl"/]
</div>

[@panel title="基本信息"]
  [#include "components/person_info.ftl"/]
[/@]

</div>
[@b.foot/]
