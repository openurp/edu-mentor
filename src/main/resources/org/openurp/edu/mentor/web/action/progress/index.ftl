[#ftl/]
[@b.head/]
[@b.toolbar title="计划完成情况"/]

<div class="search-container">
  <div class="search-panel">
    [@b.form theme="search" name="searchForm" action="!search" title="查询条件" target="contentDiv" ]
      <input type="hidden" name="project.id" value="${project.id}"/>
      [#include "searchForm.ftl"/]
    [/@]
  </div>
  <div class="search-list">
     [@b.div id="contentDiv" /]
  </div>
</div>
<script>
  jQuery(function() {
    bg.form.submit(document.searchForm);
  });
</script>
[@b.foot/]
