// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require popper
//= require bootstrap-sprockets

//= require_tree .
//= stub active_admin
document.addEventListener("DOMContentLoaded", function() {
    const targetElement = document.getElementById('wedding-header');
    
    if (targetElement) {
      smoothScrollTo(targetElement, 2000); // Scroll over 2 seconds (2000ms)
    }
});

function smoothScrollTo(target, duration) {
    let start = window.pageYOffset || document.documentElement.scrollTop,
        change = target.offsetTop - start,
        startTime = Date.now(),
        val;

    const animateScroll = function() {
        const currentTime = Date.now() - startTime;
        val = Math.easeInOutQuad(currentTime, start, change, duration);

        window.scrollTo(0, val);

        if (currentTime < duration) {
            requestAnimationFrame(animateScroll);
        } else {
            window.scrollTo(0, target.offsetTop);
        }
    };

    requestAnimationFrame(animateScroll);
}

Math.easeInOutQuad = function (t, b, c, d) {
  t /= d / 2;
  if (t < 1) return c / 2 * t * t + b;
  t--;
  return -c / 2 * (t * (t - 2) - 1) + b;
};


document.addEventListener("DOMContentLoaded", function() {
    const countdownElement = document.getElementById('countdown');
    const weddingTime = new Date('2023-12-16T20:00:00'); // Hardcoded date and time

    function updateCountdown() {
        const now = new Date();
        const diffInSeconds = (weddingTime - now) / 1000; // Convert milliseconds to seconds

        const fullDays = Math.floor(diffInSeconds / (24 * 60 * 60));
        const remainingSecondsAfterDays = diffInSeconds - (fullDays * 24 * 60 * 60);

        const hours = Math.floor(remainingSecondsAfterDays / (60 * 60));
        const remainingSecondsAfterHours = remainingSecondsAfterDays - (hours * 60 * 60);

        const minutes = Math.floor(remainingSecondsAfterHours / 60);
        const seconds = Math.floor(remainingSecondsAfterHours - (minutes * 60));

        document.getElementById('days').textContent = fullDays;
        document.getElementById('hours').textContent = hours;
        document.getElementById('minutes').textContent = minutes;
        document.getElementById('seconds').textContent = seconds;
    }

    // Initial update
    updateCountdown();

    // Update every second
    setInterval(updateCountdown, 1000);
});

