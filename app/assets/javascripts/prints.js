function update_status(id, status) {
  $.post("/prints/update_status.js", {id: id, status: status}, function(){
    document.getElementById('status_' + id).innerHTML = status;
    document.getElementById('status_btn_' + id).innerHTML="";
    if(status == 'started'){
      document.getElementById('status_btn_' + id).innerHTML="<button id=\"finish_btn_" + id + "\" onclick=\"update_status(" + id + ", 'completed')\">Complete</button><button id=\"abort_btn_" + id + "\" onclick=\"update_status(" + id + ", 'aborted')\">Abort</button>";
      window.alert("Print started!");
    }
    else if(status == 'completed'){
      document.getElementById('print_' + id).remove();
      window.alert("Print marked as complete!");
    }
    else if(status == 'aborted'){
      document.getElementById('status_btn_' + id).innerHTML="<button id=\"restart_btn_" + id + "\" onclick=\"update_status(" + id + ", 'started')\">Restart</button><button id=\"cancel_btn_" + id + "\" onclick=\"update_status(" + id + ", 'canceled')\">Cancel</button>";
      window.alert("Print aborted...");
    }
  })
  .fail(function(){
    window.alert("Cannot update status...");
  });
}

function cancel_print(id){
   $.post("/prints/update_status.js", {id: id, status: 'canceled'}, function(){
      document.getElementById('cancel_btn').style.visibility = 'hidden';
      document.getElementById('status').innerHTML = 'canceled';
   })
   .fail(function(){
     
   });
}

function update_note(id, note){
    $.post("/students/update_note.js", {id: id, note: note}, function(){
      window.alert("Note successfully updated")
    }).fail(function(){
        
    });
}