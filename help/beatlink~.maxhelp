{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		},
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 900.0, 700.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 24.0,
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 20.0, 400.0, 33.0 ],
					"text" : "beatlink~"
				}
			},
			{
				"box" : 				{
					"fontsize" : 13.0,
					"id" : "obj-subtitle",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 55.0, 500.0, 36.0 ],
					"text" : "Receive beat and tempo information from Pioneer DJ equipment\nvia the Pro DJ Link protocol"
				}
			},
			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 1.0 ],
					"fontsize" : 12.0,
					"id" : "obj-section1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 105.0, 860.0, 20.0 ],
					"text" : "  Basic Usage",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-start",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 140.0, 35.0, 22.0 ],
					"text" : "start"
				}
			},
			{
				"box" : 				{
					"id" : "obj-stop",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 85.0, 140.0, 33.0, 22.0 ],
					"text" : "stop"
				}
			},
			{
				"box" : 				{
					"id" : "obj-devices",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 128.0, 140.0, 47.0, 22.0 ],
					"text" : "devices"
				}
			},
			{
				"box" : 				{
					"id" : "obj-status",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 185.0, 140.0, 39.0, 22.0 ],
					"text" : "status"
				}
			},
			{
				"box" : 				{
					"id" : "obj-beatlink",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 7,
					"outlettype" : [ "bang", "bang", "float", "int", "int", "float", "" ],
					"patching_rect" : [ 40.0, 180.0, 380.0, 22.0 ],
					"text" : "beatlink~"
				}
			},
			{
				"box" : 				{
					"id" : "obj-beat-button",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 40.0, 220.0, 24.0, 24.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-downbeat-button",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 100.0, 220.0, 24.0, 24.0 ]
				}
			},
			{
				"box" : 				{
					"fontsize" : 24.0,
					"id" : "obj-bpm-display",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 160.0, 220.0, 80.0, 35.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-beatpos-display",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 260.0, 220.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-device-display",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 320.0, 220.0, 40.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-pitch-display",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 380.0, 220.0, 60.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-info-display",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 460.0, 220.0, 200.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-label-beat",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 250.0, 50.0, 20.0 ],
					"text" : "beat"
				}
			},
			{
				"box" : 				{
					"id" : "obj-label-downbeat",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 90.0, 250.0, 60.0, 20.0 ],
					"text" : "downbeat"
				}
			},
			{
				"box" : 				{
					"id" : "obj-label-bpm",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 160.0, 258.0, 80.0, 20.0 ],
					"text" : "BPM"
				}
			},
			{
				"box" : 				{
					"id" : "obj-label-beatpos",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 256.0, 250.0, 50.0, 20.0 ],
					"text" : "beat#"
				}
			},
			{
				"box" : 				{
					"id" : "obj-label-device",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 316.0, 250.0, 50.0, 20.0 ],
					"text" : "device#"
				}
			},
			{
				"box" : 				{
					"id" : "obj-label-pitch",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 380.0, 250.0, 60.0, 20.0 ],
					"text" : "pitch %"
				}
			},
			{
				"box" : 				{
					"id" : "obj-label-info",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 460.0, 250.0, 100.0, 20.0 ],
					"text" : "info/status"
				}
			},
			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 1.0 ],
					"fontsize" : 12.0,
					"id" : "obj-section2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 290.0, 860.0, 20.0 ],
					"text" : "  Attributes",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-attr-comment",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 320.0, 400.0, 47.0 ],
					"text" : "@autostart <0 or 1> : Auto-start listening (default: 1)\n@device <0-6> : Filter by device number (0 = all devices)"
				}
			},
			{
				"box" : 				{
					"id" : "obj-beatlink-filtered",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 7,
					"outlettype" : [ "bang", "bang", "float", "int", "int", "float", "" ],
					"patching_rect" : [ 40.0, 380.0, 380.0, 22.0 ],
					"text" : "beatlink~ @device 1 @autostart 0"
				}
			},
			{
				"box" : 				{
					"id" : "obj-filtered-comment",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 430.0, 380.0, 300.0, 20.0 ],
					"text" : "<- Listen only to device 1, don't auto-start"
				}
			},
			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 1.0 ],
					"fontsize" : 12.0,
					"id" : "obj-section3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 420.0, 860.0, 20.0 ],
					"text" : "  Messages",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-msg-comment",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 450.0, 500.0, 74.0 ],
					"text" : "start : Start listening for DJ Link devices and beats\nstop : Stop listening\ndevices : Output list of discovered devices from outlet 7\nstatus : Output current status (running/stopped, last BPM) from outlet 7\nbang : Poll for pending beat updates"
				}
			},
			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 1.0 ],
					"fontsize" : 12.0,
					"id" : "obj-section4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 540.0, 860.0, 20.0 ],
					"text" : "  Outlets",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-outlet-comment",
					"linecount" : 7,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 570.0, 500.0, 100.0 ],
					"text" : "1. beat (bang) : Outputs bang on each beat\n2. downbeat (bang) : Outputs bang on beat 1 (downbeat)\n3. bpm (float) : Current BPM with pitch adjustment\n4. beat_pos (int) : Beat position within bar (1-4)\n5. device (int) : Device/player number\n6. pitch (float) : Pitch adjustment percentage\n7. info (list) : Device info and status messages"
				}
			},
			{
				"box" : 				{
					"id" : "obj-note",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 550.0, 450.0, 300.0, 33.0 ],
					"text" : "Note: Uses UDP ports 50000 and 50001\nRequires macOS 13.3 or later",
					"textcolor" : [ 0.5, 0.5, 0.5, 1.0 ]
				}
			}
		],
		"lines" : [
			{
				"patchline" : 				{
					"destination" : [ "obj-beatlink", 0 ],
					"source" : [ "obj-start", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-beatlink", 0 ],
					"source" : [ "obj-stop", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-beatlink", 0 ],
					"source" : [ "obj-devices", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-beatlink", 0 ],
					"source" : [ "obj-status", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-beat-button", 0 ],
					"source" : [ "obj-beatlink", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-downbeat-button", 0 ],
					"source" : [ "obj-beatlink", 1 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-bpm-display", 0 ],
					"source" : [ "obj-beatlink", 2 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-beatpos-display", 0 ],
					"source" : [ "obj-beatlink", 3 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-device-display", 0 ],
					"source" : [ "obj-beatlink", 4 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-pitch-display", 0 ],
					"source" : [ "obj-beatlink", 5 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-info-display", 1 ],
					"source" : [ "obj-beatlink", 6 ]
				}
			}
		],
		"dependency_cache" : [  ],
		"autosave" : 0
	}
}
