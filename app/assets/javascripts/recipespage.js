 $(function(){
  eventListeners();
  });




 function eventListeners(){

  $("#cookedrecipe").on("click", function(event){
    var data  = event.target.href.slice(30)
    var url = '/change_status'
    $.post(url,data,function(success){
    })
    })

  }
