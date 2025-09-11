[@b.head/]
  [@b.form name="studentListForm" action="!search"]
    [@b.grid items=students var="student" sortable="true"]
      [@b.gridbar]
        var titles="person_gender.name:性别,person.birthday:出生日期,person.nation.name:民族,person.country.name:国家地区,"+
                   "person.idType.name:证件类型,person.code:证件号码,person.politicalStatus.name:政治面貌,std_code:学号,"+
                   "std_name:姓名,std_state.grade.code:年级,std_studyType.name:学习形式,std_duration:学制,"+
                   "std_level.name:培养层次,std_stdType.name:学生类别,std_eduType.name:培养类型,"+
                   "std_state.department.name:院系,std_state.major.name:专业,std_state.direction.name:专业方向,"+
                   "std_studyOn:入校日期,std_graduateOn:预计毕业日期,std_state.status.name:学籍状态,std_majorTutorNames:导师姓名,"+
                   "std_thesisTutor.name:学位论文导师姓名,contact_mobile:手机,contact_address:联系地址,contact_email:电子邮箱,"+
                   "examinee_code:考生号,examinee_examNo:准考证号,examinee_educationMode.name:培养方式,"+
                   "examinee_originDivision.name:生源地,examinee_client:委培单位"
        bar.addItem("${b.text('action.export')}",action.exportData(titles,null,'fileName=学籍信息'));
      [/@]
      [@b.row]
        [@b.boxcol/]
        [@b.col property="code" title="学号" width="120px"/]
        [@b.col property="name" title="姓名" width="80px"]
          [@b.a href="!info?id=${student.id}" target="_blank"]
            <div title="${student.name}" class="text-ellipsis">${student.name}</div>
          [/@]
        [/@]
        [@b.col property="gender.name" title="性别" width="50px"/]
        [@b.col property="state.grade" title="年级" width="60px"/]
        [@b.col property="level.name" title="培养层次" width="60px"/]
        [@b.col property="eduType.name" title="培养类型" width="60px"/]
        [@b.col property="state.department.name" title="院系" width="100px"]
          ${student.state.department.shortName!student.state.department.name}
        [/@]
        [@b.col property="state.major.name" title="专业与方向"]
          ${(student.state.major.name)!} ${(student.state.direction.name)!}
        [/@]
        [@b.col property="duration" title="学制" width="50px"/]
        [@b.col property="state.squad.name" title="班级"/]
        [#if tutorSupported]
        [@b.col property="tutor.name" title="导师" width="80px"/]
        [/#if]
        [@b.col property="state.status.name" title="学籍状态"  width="60px"/]
        [@b.col property="studyType.name" title="学习形式" width="60px"/]
        [@b.col property="beginOn" title="入学年月" width="60px"]${(student.beginOn?string("yyyy-MM"))!}[/@]
      [/@]
    [/@]
  [/@]
[@b.foot/]
