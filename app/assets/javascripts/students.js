function update_note(id, note){
    window.alert("UPDATE_NOTE");
    $.post("/students/update_note.js", {id: id, note: note}, function(){
        window.alert(id);
    }).fail(function(){
        
    });
}