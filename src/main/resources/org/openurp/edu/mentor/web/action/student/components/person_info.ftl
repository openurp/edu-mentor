[#ftl]
[#if ((student.person.id)??)]
  <table class="table table-sm table-detail" style="margin-bottom: 0px;">
    <colgroup>
      <col width="13%">
      <col width="20%">
      <col width="13%">
      <col width="20%">
      <col width="14%">
      <col width="20%">
    </colgroup>
    <tr>
      <td class="title">姓名:</td>
      <td>${student.name?html}</td>
      <td class="title">姓名拼音:</td>
      <td>${(student.person.phoneticName?html)!}</td>
      <td class="title">曾用名:</td>
      <td>${(student.person.formerName?html)!}</td>
    </tr>
    <tr>
      <td class="title">国家地区:</td>
      <td>${(student.person.country.name)!}</td>
      <td class="title">性别:</td>
      <td>${(student.person.gender.name)!}</td>
      <td class="title">出生年月:</td>
      <td>${((student.person.birthday)?string("yyyy-MM-dd"))!}</td>
    </tr>
    <tr>
      <td class="title">民族:</td>
      <td>${(student.person.nation.name)!}</td>
      <td class="title">证件类型:</td>
      <td>${(student.person.idType.name)!}</td>
      <td class="title">证件号码:</td>
      <td>${(student.person.code)!"<br>"}</td>
    </tr>
    <tr>
      <td class="title">籍贯:</td>
      <td>${((student.person.homeTown?html))!}</td>
      <td class="title">政治面貌:</td>
      <td>${(student.person.politicalStatus.name)!}</td>
      <td class="title">维护时间:</td>
      <td>${(student.person.updatedAt?string("yyyy-MM-dd HH:mm:ss"))!}</td>
    </tr>
  </table>
[/#if]
[#if ((contact.id)??)]
  <table class="table table-sm table-detail">
    <colgroup>
      <col width="13%">
      <col width="20%">
      <col width="13%">
      <col width="20%">
      <col width="14%">
      <col width="20%">
    </colgroup>
    <tr>
      <td class="title">电子邮箱:</td>
      <td>${(contact.email?html)!}</td>
      <td class="title">电话:</td>
      <td>${(contact.phone?html)!}</td>
      <td class="title">移动电话:</td>
      <td>${(contact.mobile?html)!}</td>
    </tr>
    <tr>
      <td class="title">联系地址:</td>
      <td colspan="3">${(contact.address?html)!}</td>
      <td class="title">维护时间:</td>
      <td>${(contact.updatedAt?string("yyyy-MM-dd HH:mm"))!}</td>
    </tr>
  </table>
[/#if]
