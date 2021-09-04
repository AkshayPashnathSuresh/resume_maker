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