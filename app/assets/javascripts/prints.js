function update_status(id) {
  $.post("/prints/update_status.js", {id: id, status: "started"}, function(){
      document.getElementById('status_' + id).innerHTML = "started";
      document.getElementById('status_btn_' + id).style.visibility="hidden"
      window.alert("Print started!");
    })
    .fail(function(){
      window.alert("Cannot update status...")
    })
}