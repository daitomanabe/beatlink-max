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
		"rect" : [ 50.0, 100.0, 1200.0, 800.0 ],
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
					"fontsize" : 20.0,
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 15.0, 600.0, 29.0 ],
					"text" : "beatlink~ Example - Sync with Pioneer DJ Equipment"
				}
			},
			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.4, 0.6, 1.0 ],
					"fontsize" : 14.0,
					"id" : "obj-section1-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 55.0, 350.0, 22.0 ],
					"text" : "  1. Beat Sync Metronome",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-metro-start",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 90.0, 35.0, 22.0 ],
					"text" : "start"
				}
			},
			{
				"box" : 				{
					"id" : "obj-metro-stop",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 85.0, 90.0, 33.0, 22.0 ],
					"text" : "stop"
				}
			},
			{
				"box" : 				{
					"id" : "obj-metro-beatlink",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 7,
					"outlettype" : [ "bang", "bang", "float", "int", "int", "float", "" ],
					"patching_rect" : [ 40.0, 130.0, 300.0, 22.0 ],
					"text" : "beatlink~"
				}
			},
			{
				"box" : 				{
					"id" : "obj-click",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 40.0, 200.0, 65.0, 22.0 ],
					"text" : "click~ 0.01"
				}
			},
			{
				"box" : 				{
					"id" : "obj-click-hi",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 100.0, 200.0, 65.0, 22.0 ],
					"text" : "click~ 0.02"
				}
			},
			{
				"box" : 				{
					"id" : "obj-bpf",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 40.0, 240.0, 80.0, 22.0 ],
					"text" : "biquad~ 1 0 0 0 0"
				}
			},
			{
				"box" : 				{
					"id" : "obj-bpf-hi",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 100.0, 240.0, 80.0, 22.0 ],
					"text" : "biquad~ 1 0 0 0 0"
				}
			},
			{
				"box" : 				{
					"id" : "obj-mix",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 40.0, 280.0, 80.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : 				{
					"id" : "obj-gain",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 40.0, 320.0, 50.0, 22.0 ],
					"text" : "*~ 0.5"
				}
			},
			{
				"box" : 				{
					"id" : "obj-dac",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 360.0, 55.0, 22.0 ],
					"text" : "dac~ 1 2"
				}
			},
			{
				"box" : 				{
					"id" : "obj-bpm-large",
					"fontsize" : 48.0,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 200.0, 170.0, 130.0, 62.0 ],
					"triangle" : 0
				}
			},
			{
				"box" : 				{
					"id" : "obj-bpm-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 235.0, 130.0, 20.0 ],
					"text" : "BPM",
					"textjustification" : 1
				}
			},
			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.4, 0.6, 1.0 ],
					"fontsize" : 14.0,
					"id" : "obj-section2-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.0, 55.0, 350.0, 22.0 ],
					"text" : "  2. Visual Beat Display",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-vis-beatlink",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 7,
					"outlettype" : [ "bang", "bang", "float", "int", "int", "float", "" ],
					"patching_rect" : [ 420.0, 90.0, 300.0, 22.0 ],
					"text" : "beatlink~"
				}
			},
			{
				"box" : 				{
					"id" : "obj-beat-counter",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 540.0, 130.0, 70.0, 22.0 ],
					"text" : "gate 2"
				}
			},
			{
				"box" : 				{
					"id" : "obj-beat1",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 420.0, 180.0, 50.0, 50.0 ],
					"bgcolor" : [ 1.0, 0.3, 0.3, 1.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-beat2",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 480.0, 180.0, 50.0, 50.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-beat3",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 540.0, 180.0, 50.0, 50.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-beat4",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 600.0, 180.0, 50.0, 50.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-beat1-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 420.0, 235.0, 50.0, 20.0 ],
					"text" : "1",
					"textjustification" : 1
				}
			},
			{
				"box" : 				{
					"id" : "obj-beat2-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 480.0, 235.0, 50.0, 20.0 ],
					"text" : "2",
					"textjustification" : 1
				}
			},
			{
				"box" : 				{
					"id" : "obj-beat3-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 540.0, 235.0, 50.0, 20.0 ],
					"text" : "3",
					"textjustification" : 1
				}
			},
			{
				"box" : 				{
					"id" : "obj-beat4-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 600.0, 235.0, 50.0, 20.0 ],
					"text" : "4",
					"textjustification" : 1
				}
			},
			{
				"box" : 				{
					"id" : "obj-route-beatpos",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 420.0, 130.0, 100.0, 22.0 ],
					"text" : "route 1 2 3 4"
				}
			},
			{
				"box" : 				{
					"id" : "obj-bang1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 420.0, 155.0, 22.0, 22.0 ],
					"text" : "b"
				}
			},
			{
				"box" : 				{
					"id" : "obj-bang2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 450.0, 155.0, 22.0, 22.0 ],
					"text" : "b"
				}
			},
			{
				"box" : 				{
					"id" : "obj-bang3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 480.0, 155.0, 22.0, 22.0 ],
					"text" : "b"
				}
			},
			{
				"box" : 				{
					"id" : "obj-bang4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 510.0, 155.0, 22.0, 22.0 ],
					"text" : "b"
				}
			},
			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.4, 0.6, 1.0 ],
					"fontsize" : 14.0,
					"id" : "obj-section3-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 410.0, 350.0, 22.0 ],
					"text" : "  3. Device Monitor",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-dev-start",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 445.0, 35.0, 22.0 ],
					"text" : "start"
				}
			},
			{
				"box" : 				{
					"id" : "obj-dev-devices",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 85.0, 445.0, 47.0, 22.0 ],
					"text" : "devices"
				}
			},
			{
				"box" : 				{
					"id" : "obj-dev-beatlink",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 7,
					"outlettype" : [ "bang", "bang", "float", "int", "int", "float", "" ],
					"patching_rect" : [ 40.0, 485.0, 300.0, 22.0 ],
					"text" : "beatlink~ @autostart 0"
				}
			},
			{
				"box" : 				{
					"id" : "obj-device-info",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.0, 525.0, 300.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-route-device",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 40.0, 525.0, 240.0, 22.0 ],
					"text" : "route device devices status"
				}
			},
			{
				"box" : 				{
					"id" : "obj-device-list",
					"maxclass" : "umenu",
					"items" : [ ],
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 40.0, 565.0, 200.0, 22.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-device-count",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 525.0, 100.0, 20.0 ],
					"text" : "device count:"
				}
			},
			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.4, 0.6, 1.0 ],
					"fontsize" : 14.0,
					"id" : "obj-section4-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.0, 280.0, 350.0, 22.0 ],
					"text" : "  4. MIDI Sync Output",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-midi-beatlink",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 7,
					"outlettype" : [ "bang", "bang", "float", "int", "int", "float", "" ],
					"patching_rect" : [ 420.0, 315.0, 300.0, 22.0 ],
					"text" : "beatlink~"
				}
			},
			{
				"box" : 				{
					"id" : "obj-clockout",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 420.0, 420.0, 100.0, 22.0 ],
					"text" : "midiout"
				}
			},
			{
				"box" : 				{
					"id" : "obj-midiclock",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 420.0, 385.0, 80.0, 22.0 ],
					"text" : "midiformat"
				}
			},
			{
				"box" : 				{
					"id" : "obj-clock-msg",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 420.0, 350.0, 80.0, 22.0 ],
					"text" : "248"
				}
			},
			{
				"box" : 				{
					"id" : "obj-bpm-to-ms",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 540.0, 350.0, 100.0, 22.0 ],
					"text" : "expr 60000./$f1/24"
				}
			},
			{
				"box" : 				{
					"id" : "obj-midi-metro",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 540.0, 385.0, 60.0, 22.0 ],
					"text" : "metro 20"
				}
			},
			{
				"box" : 				{
					"id" : "obj-midi-comment",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 620.0, 370.0, 140.0, 33.0 ],
					"text" : "Send MIDI clock\nbased on DJ BPM"
				}
			},
			{
				"box" : 				{
					"id" : "obj-instructions",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 800.0, 55.0, 380.0, 87.0 ],
					"text" : "Instructions:\n1. Connect to same network as Pioneer DJ equipment\n2. Turn on audio (click speaker icon in toolbar)\n3. beatlink~ will auto-discover devices\n4. Play music on CDJ/XDJ to see beat sync\n5. Use \"devices\" message to list all discovered players"
				}
			}
		],
		"lines" : [
			{
				"patchline" : 				{
					"destination" : [ "obj-metro-beatlink", 0 ],
					"source" : [ "obj-metro-start", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-metro-beatlink", 0 ],
					"source" : [ "obj-metro-stop", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-click", 0 ],
					"source" : [ "obj-metro-beatlink", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-click-hi", 0 ],
					"source" : [ "obj-metro-beatlink", 1 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-bpm-large", 0 ],
					"source" : [ "obj-metro-beatlink", 2 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-bpf", 0 ],
					"source" : [ "obj-click", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-bpf-hi", 0 ],
					"source" : [ "obj-click-hi", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-mix", 0 ],
					"source" : [ "obj-bpf", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-mix", 1 ],
					"source" : [ "obj-bpf-hi", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-gain", 0 ],
					"source" : [ "obj-mix", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-dac", 0 ],
					"source" : [ "obj-gain", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-dac", 1 ],
					"source" : [ "obj-gain", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-route-beatpos", 0 ],
					"source" : [ "obj-vis-beatlink", 3 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-bang1", 0 ],
					"source" : [ "obj-route-beatpos", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-bang2", 0 ],
					"source" : [ "obj-route-beatpos", 1 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-bang3", 0 ],
					"source" : [ "obj-route-beatpos", 2 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-bang4", 0 ],
					"source" : [ "obj-route-beatpos", 3 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-beat1", 0 ],
					"source" : [ "obj-bang1", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-beat2", 0 ],
					"source" : [ "obj-bang2", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-beat3", 0 ],
					"source" : [ "obj-bang3", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-beat4", 0 ],
					"source" : [ "obj-bang4", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-dev-beatlink", 0 ],
					"source" : [ "obj-dev-start", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-dev-beatlink", 0 ],
					"source" : [ "obj-dev-devices", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-route-device", 0 ],
					"source" : [ "obj-dev-beatlink", 6 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-device-list", 0 ],
					"source" : [ "obj-route-device", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-device-info", 1 ],
					"source" : [ "obj-route-device", 3 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-clock-msg", 0 ],
					"source" : [ "obj-midi-beatlink", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-bpm-to-ms", 0 ],
					"source" : [ "obj-midi-beatlink", 2 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-midiclock", 0 ],
					"source" : [ "obj-clock-msg", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-clockout", 0 ],
					"source" : [ "obj-midiclock", 0 ]
				}
			},
			{
				"patchline" : 				{
					"destination" : [ "obj-midi-metro", 1 ],
					"source" : [ "obj-bpm-to-ms", 0 ]
				}
			}
		],
		"dependency_cache" : [  ],
		"autosave" : 0
	}
}
