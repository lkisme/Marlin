; Hornet Custom Start G-Code

;Cura
M140 S{material_bed_temperature_layer_0} ; Set Heat Bed temperature
M190 S{material_bed_temperature_layer_0} ; Wait for Heat Bed temperature
;Prusaslicer
M140 S[first_layer_temperature] ; Set Heat Bed temperature
M190 S[first_layer_bed_temperature] ; Wait for Heat Bed temperature

M104 S200 ; start warming extruder to 200
G28 ; Home all axes

; Start UBL

G29 A      ; Activate the UBL System.
G29 L0     ; Load UBL at slot 0
G29 J2     ; 4-point level
G29 F10.0  ; Fade to 10mm
G92 E0     ; Reset Extruder

; End UBL

G1 Z1.0 F3000 ; move z up little to prevent scratching of surface
G1 X200.0 Y0.2 Z0.3 F5000.0 ; move to start-line position

;Cura
M104 S{material_print_temperature_layer_0} ; Set Extruder temperature
M109 S{material_print_temperature_layer_0} ; Wait for Extruder temperature
;Prusaslicer
M104 S[first_layer_temperature] ; Set Extruder temperature
M109 S[first_layer_temperature] ; Wait for Extruder temperature

G1 X100.0 Y0.2 Z0.3 F1500.0 E10 ; draw 1st line
G1 X100.0 Y0.6 Z0.3 F5000.0 ; move to side a little
G1 X200.0 Y0.6 Z0.3 F1500.0 E20 ; draw 2nd line
G92 E0 ; reset extruder
G1 Z1.0 F3000 ; move z up little to prevent scratching of surface

; End Custom Start GCode