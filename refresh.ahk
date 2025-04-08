^r::

reload,

sleep, 1000

return
;

!r::

Coordmode, Mouse, Screen

loop, 30 
{
mousemove, 500, 250
sleep, 15000
mousemove, 1000, 250
sleep, 15000
mousemove, 1000, 750
sleep, 15000
mousemove, 500, 750
sleep, 15000
}
return

;