; Marlin 3D Printer Auto Bed Level Test
; Description: Used to test and debug automatic bed level settings
; Author: Garret Hartman
; Created: 2-18-18
; Last Modified 2-19-18

; How To Run This Script:
;     1. Install printrun package (contains pronsole and pronterface)
;     2. Load gcode to printer in terminal using the following command:
;          pronsole -e load <path_to_this_gcode_file>
;     3. If there 3D printer connected it will will auto select the usb connection 
;        and load the gcode. The gcode will be executed by the printer as soon as 
;        the load completes.

G28        ; Auto-home all axis.

M111 S32   ; Set debug level to 32 (Bed Level Log Enabled).

G29 V4     ; Run auto level procedure with log verbosity set to 4 or T (T = V2).

M48        ; Probe repeatability test. Standard deviation reported should < 0.02(mm).
           ;    If standard deviation is larger than 0.02mm, there is something wrong.
           ;    At the time of this writing my inductive z-probe standard deviation
           ;    is aprox 0.002~0.003mm.

           ; After running auto bed leveling and probe repeat test the nozzle
           ;     should remain located at the final bed level (x, y) point.

G28        ; Auto-home all axis needed after auto bed level.

G26 Q6.0   ; Print bed level mesh validation pattern (Defaults to PLA) 
           ;     Q6.0 option sets retraction length to 6mm for bowden extruders
