fetch('/data/adb/kawakami_fix_events.json')
.then(r=>r.text())
.then(t=>document.getElementById('log').innerText=t);
