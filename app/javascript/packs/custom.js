window.addEducation = function() {
    var index = ++document.getElementById('educationindex').value;
    Rails.ajax({
        url: '/add_new_education',
        type: 'GET',
        data: new URLSearchParams({'education_index': index}).toString(),
      })
}

window.addWork = function() {
    var index = ++document.getElementById('workindex').value;
    Rails.ajax({
        url: '/add_new_work',
        type: 'GET',
        data: new URLSearchParams({'work_index': index}).toString(),
      })
}

window.addProject = function() {
  var index = ++document.getElementById('projectindex').value;
  Rails.ajax({
      url: '/add_new_project',
      type: 'GET',
      data: new URLSearchParams({'project_index': index}).toString(),
    })
}
var hostingServiceBaseOption = "Select your hosting service";
window.selectHostingService = function() {
  checkHostingService();
}
document.addEventListener('turbolinks:load', function() {
  if(document. getElementById("address_hosting_service")){
    checkHostingService();
  }
});

function checkHostingService(){
  if(document. getElementById("address_hosting_service").value == hostingServiceBaseOption){
    document. getElementById("address_repository_url"). value = "";
    document. getElementById("address_repository_url"). disabled = true;
  }else{
    document. getElementById("address_repository_url"). disabled = false;
  }
}