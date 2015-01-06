window.onload = function() {

  // Check for LocalStorage support.
  if (localStorage) {

    // Add an event listener for form submissions
    document.getElementById('einkaufslisteForm').addEventListener('submit', function() {
      // Get the value of the name field.
      var name = document.getElementById('name').value;

      // Save the name in localStorage.
      localStorage.setItem('einkaufsliste', name);
    });

  }

}
