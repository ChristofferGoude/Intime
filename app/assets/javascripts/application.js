// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function () {
  setTimeout(function () {
      $(".alert").fadeOut();
  }, 2000);
  
    var Stopwatch = function(elem, options) {
      
      var timer       = createTimer(),
          startButton = createButton("start", start),
          stopButton  = createButton("stop", stop),
          resetButton = createButton("reset", reset),
          offset,
          clock,
          interval;
      
      // default options
      options = options || {};
      options.delay = options.delay || 1;
     
      // append elements     
      elem.appendChild(timer);
      elem.appendChild(startButton);
      elem.appendChild(stopButton);
      
      // initialize
      reset();
      
      // private functions
      function createTimer() {
        return document.createElement("span");
      }
      
      function createButton(action, handler) {
        var a = document.createElement("a");
        a.href = "#" + action;
        a.innerHTML = action;
        a.addEventListener("click", function(event) {
          handler();
          event.preventDefault();
        });
        return a;
      }
      
      function start() {
        if (!interval) {
          offset   = Date.now();
          interval = setInterval(update, options.delay);
        }
      }
      
      function stop() {
        if (interval) {
          clearInterval(interval);
          interval = null;
        }
      }
      
      function reset() {
        clock = 0;
        render(0);
      }
      
      function update() {
        clock += delta();
        render();
      }
      
      function render() {
        timer.innerHTML = clock/1000; 
      }
      
      function delta() {
        var now = Date.now(),
            d   = now - offset;
        
        offset = now;
        return d;
      }
      
      // public API
      this.start  = start;
      this.stop   = stop;
      this.reset  = reset;
    };
    
    var elems = document.getElementsByClassName("stopwatch");
    
    for (var i=0, len=elems.length; i<len; i++) {
      new Stopwatch(elems[i]);
    }
    
    var d = document.getElementById("d-timer");
    dTimer = new Stopwatch(d, {delay: 1000});
    dTimer.start();
});

$(document).on("click", "#newtask", function () {
    $("#task").toggle();
});

