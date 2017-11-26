<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>角色——权限分配</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    
  <script type="text/javascript" src="/static/js/jquery-2.1.3.min.js"></script>
  <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="/static/css/bootstrap-table.min.css"/>
  <script type="text/javascript" src="/static/js/bootstrap-table.min.js"></script>
  <script type="text/javascript" src="/static/js/bootstrap-table-zh-CN.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/static/font-awesome-4.7.0/css/font-awesome.min.css"/>
  <script type="text/javascript" src="/static/js/moment.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/static/css/bootstrap-treeview.css"/>
  <script src="/static/js/bootstrap-treeview.js"></script>
</head>

<body>

  <div class="col-sm-12 col-md-12 col-lg-12"> 
    <!-- 角色表 -->
    <div id="h-role-info" class="col-sm-6 col-md-6 col-lg-6">
      <h3>角色表</h3>
      <div id="toolbar1" class="btn-group">
        <button type="button" data-name="addButton" id="addButton" class="btn btn btn-info btn-sm"> <i class="fa fa-plus">添加</i>
        </button>
        <button type="button" data-name="editorButton" id="editorButton" class="btn btn btn-primary btn-sm"> <i class="fa fa-edit">编辑</i>
        </button>
        <button type="button" data-name="deleteButton" id="deleteButton" class="btn btn btn-danger btn-sm">
        <i class="fa fa-trash">删除</i>
        </button>
      </div>
        <table id="table"
               data-url="/admin/role/get/"
               data-toggle="table"
               data-striped="true"
               data-toolbar="#toolbar1"
               data-show-refresh="true"
               data-show-toggle="true"
               data-show-columns="true"
               data-side-pagination="client"
               data-pagination="true"
               data-click-to-select="true"
               data-page-size="5"
               data-page-list="[5, 25, 50, All]"
               data-search="false">
            <thead>
            <tr>
                <th data-field="state" data-checkbox="true"></th>
                <th data-formatter="index1">#</th>
                <th data-field="Rolenumber">角色编码</th>
                <th data-field="Rolename">角色名称</th>
                <th data-align="center" data-formatter="StatusFormatter">状态</th>
                <!-- <th data-field="domain_desc">所属域</th> -->
                <!-- <th data-align="center"
                    data-field="create_user">创建人</th> -->
                <th data-align="center" data-field="Createtime" data-formatter="localDateFormatter" data-visible="false">创建时间</th>
                <!-- <th data-align="center"
                    data-field="modify_user">修改人</th> -->
                <th data-align="center" data-field="Updated" data-formatter="localDateFormatter" data-visible="false">修改时间</th>
                <!-- <th data-field="state-handle"
                    data-align="center"
                    data-formatter="RoleObj.formatter">资源操作</th> -->
            </tr>
            </thead>
        </table>
    </div>
    <!-- 项目表 -->
    <div class="col-sm-6 col-md-6 col-lg-6">
      <h3>项目列表</h3>
      <table id="table2"  
        data-url="/project/getprojects"
        data-toggle="table"
       data-search="true"
       data-show-refresh="true"
       data-show-toggle="true"
       data-show-columns="true"
       data-click-to-select="true"
       data-side-pagination="client"
       data-pagination="true"
       data-page-size="5"
        data-page-list="[5, 10, All]"
       data-query-params="queryParams"
        >
        <thead>        
          <tr>
          <!-- radiobox data-checkbox="true"-->
          <th data-width="10" data-checkbox="true"></th>
          <th data-formatter="index1">#</th>
          <th data-field="Code">编号</th>
          <th data-field="Title">名称</th>
          <!-- <th data-field="Label">标签</th> -->
          <th data-field="Principal">负责人</th>
          <!-- <th data-field="Product">成果数量</th> -->
          <th data-field="Created" data-formatter="localDateFormatter" data-visible="false">建立时间</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>

  <div class="col-sm-12 col-md-12 col-lg-12">
    <!-- 权限表 -->
    <div class="col-sm-6 col-md-6 col-lg-6">
      <div id="toolbar3" class="btn-group">
        <button type="button" id="editorButton3" class="btn btn btn-primary btn-sm"> <i class="fa fa-edit">保存修改</i>
        </button>
      </div>
      <h3>权限表</h3>
      <table id="table3"  
        data-toolbar="#toolbar3"
        data-detail-view="true"
       data-query-params="queryParams"
        >
        <thead>        
          <tr>
            <!-- radiobox data-checkbox="true"-->
            <th data-width="10" data-checkbox="true"></th>
            <th data-formatter="index1">#</th>
            <th data-field="Title">权限名</th>
            <!-- <th data-field="PDF" data-formatter="checkDateFormatter">PDF</th>
            <th data-field="DWG" data-formatter="checkDateFormatter">DWG</th>
            <th data-field="DOC" data-formatter="checkDateFormatter">DOC</th>
            <th data-field="XLS" data-formatter="checkDateFormatter">XLS</th> -->
          </tr>
        </thead>
      </table>
    </div>

    <!-- 项目目录 -->
    <div class="col-sm-6 col-md-6 col-lg-6">
      <div id="details" style="display:none">
        <h3 id="rowtitle"></h3>
          <div class="modal-body">
              <div id="tree"></div>
          </div>
      </div>
    </div>
  </div> 

  <script>
  /*数据json,"PDF":"","DWG":"","DOC":"","XLS":""*/
  // 权限表
  var json =  [{"Id":"1","Title":"添加成果"},
                {"Id":"2","Title":"编辑成果"},
                {"Id":"3","Title":"删除成果"},
                {"Id":"4","Title":"读取成果"}];
  var json1 =  [{"Id":"5","Title":"任意"},
                {"Id":"6","Title":"PDF","checked":true},
                {"Id":"7","Title":"DWG"},
                {"Id":"8","Title":"DOC"},
                {"Id":"8","Title":"XLS"},
                {"Id":"8","Title":"DGN"}];              
        /*初始化table数据*/
        $(function(){
            $("#table3").bootstrapTable({
              data:json,
              // onClickRow: function (row, $element) {
                // alert( "选择了行Id为: " + row.Id );
                // rowid=row.Id//全局变量
                // $('#table1').bootstrapTable('refresh', {url:'/admincategory?pid='+row.Id});
              // }
              // onExpandRow: function (index, row, $Subdetail) {
              //   oInit.InitSubTable(index, row, $Subdetail);
              // }
              onExpandRow: function (index, row, $detail) {
                expandTable(index, row,$detail);
              }
            });
        });
      function expandTable(index, row,$detail) {
        var cur_table = $detail.html('<table id="table4"></table>').find('table');
        if (index==3){
          $(cur_table).bootstrapTable({
            columns: [{
                  checkbox: true,
                  formatter: "stateFormatter"
              }, {
                  field: 'Title',
                  title: '文件扩展名'
              }],
            data:json1,
          })
        }
      }
  //初始化子表格(无线循环)
    // oInit.InitSubTable = function (index, row, $detail) {
    //     var parentid = row.MENU_ID;
    //     var cur_table = $detail.html('<table></table>').find('table');
    //     $(cur_table).bootstrapTable({
    //         url: '/api/MenuApi/GetChildrenMenu',
    //         method: 'get',
    //         queryParams: { strParentID: parentid },
    //         ajaxOptions: { strParentID: parentid },
    //         clickToSelect: true,
    //         detailView: true,//父子表
    //         uniqueId: "MENU_ID",
    //         pageSize: 10,
    //         pageList: [10, 25],
    //         columns: [{
    //             checkbox: true
    //         }, {
    //             field: 'MENU_NAME',
    //             title: '菜单名称'
    //         }, {
    //             field: 'MENU_URL',
    //             title: '菜单URL'
    //         }, {
    //             field: 'PARENT_ID',
    //             title: '父级菜单'
    //         }, {
    //             field: 'MENU_LEVEL',
    //             title: '菜单级别'
    //         }, ],
    //         //无线循环取子表，直到子表里面没有记录
    //         onExpandRow: function (index, row, $Subdetail) {
    //             oInit.InitSubTable(index, row, $Subdetail);
    //         }
    //     });
    // };

  function index1(value,row,index){
    return index+1
  }

  function stateFormatter(value, row, index) {
    if (row.checked === true) {
        return {
            // disabled: true,
            checked: true
        }
    }
    return value;
  }

  function StatusFormatter(value, row, index) {
    // alert(row.Status);
    if (row.Status == "0") {
        return '正常';
    }else{
      return '失效';
    }
  }

  function localDateFormatter(value) {
    return moment(value, 'YYYY-MM-DD').format('YYYY-MM-DD');
  }
  function checkDateFormatter(value) {
    return '<input type="checkbox" name="bike"/>';
  }

  $(document).ready(function() {
    //添加角色
    $("#addButton").click(function() {
        $('#modalTable').modal({
        show:true,
        backdrop:'static'
        });
    })
    //删除角色
    $("#deleteButton").click(function() {
     var selectRow=$('#table').bootstrapTable('getSelections');
     if (selectRow.length<=0) {
       alert("请先勾选！");
       return false;
     }
     var titles=$.map(selectRow,function(row){
       // alert(row.Id);
       // return row.Id;
       // alert(row.Title);
       return row.Title;
     })
     var ids="";
     for(var i=0;i<selectRow.length;i++){
       if(i==0){
         ids=selectRow[i].Id;
       }else{
         ids=ids+","+selectRow[i].Id;
       }  
     }
     $.ajax({
       type:"post",
       url:"/admin/role/delete",
       data: {ids:ids},
       success:function(data,status){
         alert("删除“"+data+"”成功！(status:"+status+".)");
         //删除已选数据
         $('#table1').bootstrapTable('remove',{
           field:'Title',
           values:titles
         });
       }
     }); 
    })
    //编辑角色模态框
    $("#editorButton").click(function() {
      var selectRow=$('#table').bootstrapTable('getSelections');
      if (selectRow.length<1){
        alert("请先勾选角色！");
        return;
      }
      if (selectRow.length>1){
        alert("请不要勾选一个以上角色！");
        return;
      }
      $("input#cid").remove();
      var th1="<input id='cid' type='hidden' name='cid' value='" +selectRow[0].Id+"'/>"
      $(".modal-body").append(th1);//这里是否要换名字$("p").remove();
      $("#Rolename1").val(selectRow[0].Rolename);
      $("#Rolenumber1").val(selectRow[0].Rolenumber);
      $("#Status1").val(selectRow[0].Status);
      // alert(JSON.stringify(selectRow));
      // alert(selectRow[0].Id);
      // var title = $('#'+id).attr("value");
      // var title = $('#'+id).attr("href");
      // var categoryid = $('#categoryid').val();
        $('#modalTable1').modal({
        show:true,
        backdrop:'static'
        });
    })
  }) 
    //新建角色
    function save(){
      // var radio =$("input[type='radio']:checked").val();        
      var Rolename = $('#Rolename').val();
      var Rolenumber = $('#Rolenumber').val();
      // var Status     = $('#Status option:selected').text();
      var Status = $('#Status option:selected').val();

      if (Rolename)
        {  
            $.ajax({
                type:"post",
                url:"/admin/role/post",
                data: {rolename:Rolename,rolenumber:Rolenumber,status:Status},
                success:function(data,status){
                  alert("添加“"+data+"”成功！(status:"+status+".)");
                 }
            });  
        } else{
          alert("角色名等不能为空！");
        }
        // $(function(){$('#myModal').modal('hide')}); 
          $('#modalTable').modal('hide');
          $('#table').bootstrapTable('refresh', {url:'/admin/role/get'});
          // "/category/modifyfrm?cid="+cid
          // window.location.reload();//刷新页面
    }

    //更新角色
    function update(){
     // var radio =$("input[type='radio']:checked").val();
     var roleid1 = $('#cid').val();
     var rolename1 = $('#Rolename1').val();
     var rolenumber1 = $('#Rolenumber1').val();
     var status1 = $('#Status1').val();
     // $('#myModal').on('hide.bs.modal', function () {  
     if (rolename1)
      {  
          $.ajax({
              type:"put",
              url:"/admin/role/update",
              data: {roleid:roleid1,rolename:rolename1,rolenumber:rolenumber1,status:status1},
              success:function(data,status){
                alert("修改“"+data+"”成功！(status:"+status+".)");
               }
          });  
      } 
      // $(function(){$('#myModal').modal('hide')});
        $('#modalTable1').modal('hide');
        $('#table').bootstrapTable('refresh', {url:'/admin/role/get/'});
        // "/category/modifyfrm?cid="+cid
        // window.location.reload();//刷新页面
    }

    //点击项目显示目录
    $(function(){
     $("#table2").on("click-row.bs.table",function(e,row,ele){
        $(".info").removeClass("info");
        $(ele).addClass("info");
        rowid=row.Id;//全局变量
        rowtitle=row.Title
        $("#rowtitle").html("项目目录-"+rowtitle);
         
        // $('#iptable').bootstrapTable('refresh', {url:'/admin/project/synchip/'+row.Id});
        $("input#cid").remove();
          var th1="<input id='cid' type='hidden' name='cid' value='" +rowid+"'/>"
        $(".modal-body").append(th1);
         //初始化树   
        $.ajax({  //JQuery的Ajax  
            type: 'POST',    
            dataType : "json",//返回数据类型  
            // async:false, //同步会出现警告：Synchronous XMLHttpRequest on the main thread is deprecated because of its detrimental effects to the end user's experience 
            url: "/admin/project/getprojectcate/"+rowid,//请求的action路径  
            // data: {"flag":true},  //同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行  
            error: function () {//请求失败处理函数    
                alert('请求失败');    
            },  
            success:function(data){ //请求成功后处理函数。取到Json对象data
              // alert(data);
              $('#tree').treeview({
                showCheckbox: true,
                data: [data], // data is not optional
                levels: 3,
                enableLinks: true,
                hierarchicalCheck:true,//有效！！
                // propagateCheckEvent:true,
                state: {
                  checked: true,
                  disabled: true,
                  expanded: true,
                  selected: true
                }
              });
              $('#tree').treeview('expandAll');//这句为何无效？
              $("#details").show();  
            }
        });
     });
    });

    // 保存权限和修改权限
    $("#editorButton3").click(function() {
      // if ({{.role}}!=1){
      //   alert("权限不够！");
      //   return;
      // }
      var selectRow=$('#table').bootstrapTable('getSelections');
      if (selectRow.length<=0) {
        alert("请先勾选角色！");
        return false;
      }
      // var title=$.map(selectRow,function(row){
      //   return row.Title;
      // })
      var roleids="";
      for(var i=0;i<selectRow.length;i++){
        if(i==0){
          roleids=selectRow[i].Id;
        }else{
          roleids=roleids+","+selectRow[i].Id;
        }  
      }

      var selectRow=$('#table3').bootstrapTable('getSelections');
      if (selectRow.length<=0) {
        alert("请先勾选权限！");
        return false;
      }
      // if(confirm("确定删除吗？一旦删除将无法恢复！")){
      // var title=$.map(selectRow,function(row){
      //   return row.Title;
      // })
      var permissionids="";
      for(var i=0;i<selectRow.length;i++){
        if(i==0){
          permissionids=selectRow[i].Title;
        }else{
          permissionids=permissionids+","+selectRow[i].Title;
        }  
      }

      var selectRow=$('#table4').bootstrapTable('getSelections');
      // if (selectRow.length<=0) {
      //   alert("请先勾选权限！");
      //   return false;
      // }
      var sufids="";
      for(var i=0;i<selectRow.length;i++){
        if(i==0){
          sufids=selectRow[i].Title;
        }else{
          sufids=sufids+","+selectRow[i].Title;
        }  
      }

      arr=$('#tree').treeview('getChecked');
        if (arr.length==0){
          alert("请先勾选目录！");
          return;
        }
        // alert(JSON.stringify(arr));
        // if (arr.length>=2){
        //   alert("请不要勾选一个以上！");
        //   return;
        // }
      var treeids="";
      var treenodeids="";
      for(var i=0;i<arr.length;i++){
        if(i==0){
          treeids=arr[i].id;
          treenodeids=arr[i].nodeId;
        }else{
          treeids=treeids+","+arr[i].id;
          treenodeids=treenodeids+","+arr[i].nodeId;
        }  
      }

      $.ajax({
        type:"post",
        url:"/admin/role/permission",
        data: {roleids:roleids,permissionids:permissionids,treeids:treeids,treenodeids:treenodeids,sufids:sufids},
        success:function(data,status){
          alert("添加“"+data+"”成功！(status:"+status+".)");
          // $('#table').bootstrapTable('refresh', {url:'/admin/role/get/'});
        }
      });  
    })
  </script>

  <!-- 添加角色 -->
  <div class="container">
    <form class="form-horizontal">
    <div class="modal fade" id="modalTable">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">&times;</span>
            </button>
            <h3 class="modal-title">添加角色</h3>
          </div>
          <div class="modal-body">
            <div class="modal-body-content">        
              <div class="form-group must">
                <label class="col-sm-3 control-label">角色名</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" id="Rolename"></div>
              </div>
              <div class="form-group must">
                <label class="col-sm-3 control-label">角色编号</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" id="Rolenumber"></div>
              </div>

              <div class="form-group must">
                <label class="col-sm-3 control-label">状态</label>
                <div class="col-sm-7">
                  <select id="Status" class="form-control">
                    <option value="0">正常</option>
                    <option value="1">失效</option>
                  </select>
                </div>
              </div>

            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="button" class="btn btn-primary" onclick="save()">保存</button>
        </div>
      </div>
    </div>
      </div>
    </form>
  </div>
  <!-- 修改角色 -->
  <div class="container">
    <form class="form-horizontal">
    <div class="modal fade" id="modalTable1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">&times;</span>
            </button>
            <h3 class="modal-title">修改角色</h3>
          </div>
          <div class="modal-body">
            <div class="modal-body-content">
              <div class="form-group must">
                <label class="col-sm-3 control-label">角色名</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" id="Rolename1"></div>
              </div>
              <div class="form-group must">
                <label class="col-sm-3 control-label">角色编号</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" id="Rolenumber1"></div>
              </div>
              <div class="form-group must">
                <label class="col-sm-3 control-label">状态</label>
                <div class="col-sm-7">
                  <select id="Status1" class="form-control">
                    <option value="0">正常</option>
                    <option value="1">失效</option>
                  </select>
                </div>
              </div>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="button" class="btn btn-primary" onclick="update()">修改</button>
        </div>
      </div>
    </div>
      </div>
    </form>
  </div>

</body>
</html>