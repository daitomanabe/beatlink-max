{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 8,
			"minor": 6,
			"revision": 0,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			100,
			100,
			1040,
			780
		],
		"bglocked": 0,
		"openinpresentation": 0,
		"default_fontsize": 12,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [
			15,
			15
		],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,
		"lefttoolbarpinned": 0,
		"toptoolbarpinned": 0,
		"righttoolbarpinned": 0,
		"bottomtoolbarpinned": 0,
		"toolbars_unpinned_last_save": 0,
		"tallnewobj": 0,
		"boxanimatetime": 200,
		"enablehscroll": 1,
		"enablevscroll": 1,
		"devicewidth": 0,
		"description": "Help patch for beatlink~",
		"digest": "Pro DJ Link beat and device monitor",
		"tags": "network,dj,sync,beatlink",
		"style": "",
		"subpatcher_template": "",
		"assistshowspatchername": 0,
		"boxes": [
			{
				"box": {
					"id": "obj-title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						24,
						20,
						420,
						34
					],
					"fontface": 1,
					"fontsize": 24,
					"text": "beatlink~"
				}
			},
			{
				"box": {
					"id": "obj-subtitle",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						24,
						56,
						780,
						22
					],
					"fontsize": 13,
					"text": "Receive beat, tempo, pitch, and device announcements from Pioneer DJ equipment over Pro DJ Link."
				}
			},
			{
				"box": {
					"id": "sec-basic",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						24,
						96,
						960,
						22
					],
					"bgcolor": [
						0.18,
						0.18,
						0.18,
						1
					],
					"textcolor": [
						1,
						1,
						1,
						1
					],
					"fontsize": 12,
					"text": "  Basic usage"
				}
			},
			{
				"box": {
					"id": "msg-bang",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						44,
						134,
						44,
						22
					],
					"text": "bang",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "msg-start",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						98,
						134,
						48,
						22
					],
					"text": "start",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "msg-stop",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						156,
						134,
						44,
						22
					],
					"text": "stop",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "msg-devices",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						210,
						134,
						58,
						22
					],
					"text": "devices",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "msg-status",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						278,
						134,
						52,
						22
					],
					"text": "status",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "note-autostart",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						350,
						133,
						570,
						36
					],
					"linecount": 2,
					"text": "This help patch uses @autostart 0, so opening help does not bind UDP ports until start is clicked."
				}
			},
			{
				"box": {
					"id": "obj-beatlink",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 7,
					"patching_rect": [
						44,
						184,
						250,
						22
					],
					"text": "beatlink~ @autostart 0",
					"outlettype": [
						"bang",
						"bang",
						"float",
						"int",
						"int",
						"float",
						""
					]
				}
			},
			{
				"box": {
					"id": "label-object",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						304,
						184,
						90,
						20
					],
					"text": "control inlet"
				}
			},
			{
				"box": {
					"id": "sec-outlets",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						24,
						230,
						960,
						22
					],
					"bgcolor": [
						0.18,
						0.18,
						0.18,
						1
					],
					"textcolor": [
						1,
						1,
						1,
						1
					],
					"fontsize": 12,
					"text": "  Outlets"
				}
			},
			{
				"box": {
					"id": "mon-beat",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						44,
						270,
						24,
						24
					],
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "mon-downbeat",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						108,
						270,
						24,
						24
					],
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "mon-bpm",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						180,
						266,
						82,
						35
					],
					"format": 6,
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "mon-beatpos",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						292,
						270,
						52,
						22
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "mon-device",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						374,
						270,
						52,
						22
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "mon-pitch",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						456,
						270,
						82,
						22
					],
					"format": 6,
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "lbl-beat",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						36,
						302,
						52,
						20
					],
					"text": "beat"
				}
			},
			{
				"box": {
					"id": "lbl-downbeat",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						88,
						302,
						80,
						20
					],
					"text": "downbeat"
				}
			},
			{
				"box": {
					"id": "lbl-bpm",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						194,
						302,
						52,
						20
					],
					"text": "bpm"
				}
			},
			{
				"box": {
					"id": "lbl-beatpos",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						282,
						302,
						70,
						20
					],
					"text": "beat pos"
				}
			},
			{
				"box": {
					"id": "lbl-device",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						374,
						302,
						62,
						20
					],
					"text": "device"
				}
			},
			{
				"box": {
					"id": "lbl-pitch",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						456,
						302,
						72,
						20
					],
					"text": "pitch %"
				}
			},
			{
				"box": {
					"id": "sec-info",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						24,
						344,
						960,
						22
					],
					"bgcolor": [
						0.18,
						0.18,
						0.18,
						1
					],
					"textcolor": [
						1,
						1,
						1,
						1
					],
					"fontsize": 12,
					"text": "  Info outlet routing"
				}
			},
			{
				"box": {
					"id": "route-info",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 6,
					"patching_rect": [
						44,
						386,
						256,
						22
					],
					"text": "route found lost device devices status",
					"outlettype": [
						"",
						"",
						"",
						"int",
						"",
						""
					]
				}
			},
			{
				"box": {
					"id": "prepend-found",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						44,
						430,
						78,
						22
					],
					"text": "prepend set",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "prepend-lost",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						174,
						430,
						78,
						22
					],
					"text": "prepend set",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "prepend-device",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						304,
						430,
						78,
						22
					],
					"text": "prepend set",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "prepend-status",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						566,
						430,
						78,
						22
					],
					"text": "prepend set",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "mon-found",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						44,
						470,
						112,
						22
					],
					"text": "no device",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "mon-lost",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						174,
						470,
						112,
						22
					],
					"text": "no device",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "mon-device-info",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						304,
						470,
						142,
						22
					],
					"text": "no device",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "mon-device-count",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						480,
						470,
						52,
						22
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "mon-status",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						566,
						470,
						150,
						22
					],
					"text": "stopped 0. 0",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "print-info",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						752,
						430,
						118,
						22
					],
					"text": "print beatlink-info"
				}
			},
			{
				"box": {
					"id": "lbl-found",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						44,
						500,
						76,
						20
					],
					"text": "found"
				}
			},
			{
				"box": {
					"id": "lbl-lost",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						174,
						500,
						76,
						20
					],
					"text": "lost"
				}
			},
			{
				"box": {
					"id": "lbl-device-info",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						304,
						500,
						76,
						20
					],
					"text": "device"
				}
			},
			{
				"box": {
					"id": "lbl-device-count",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						466,
						500,
						112,
						20
					],
					"text": "devices count"
				}
			},
			{
				"box": {
					"id": "lbl-status",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						566,
						500,
						260,
						20
					],
					"text": "status: state last_bpm active_clients"
				}
			},
			{
				"box": {
					"id": "sec-attrs",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						24,
						548,
						960,
						22
					],
					"bgcolor": [
						0.18,
						0.18,
						0.18,
						1
					],
					"textcolor": [
						1,
						1,
						1,
						1
					],
					"fontsize": 12,
					"text": "  Attributes and message formats"
				}
			},
			{
				"box": {
					"id": "attr-example",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 7,
					"patching_rect": [
						44,
						586,
						274,
						22
					],
					"text": "beatlink~ @device 1 @autostart 0",
					"outlettype": [
						"bang",
						"bang",
						"float",
						"int",
						"int",
						"float",
						""
					]
				}
			},
			{
				"box": {
					"id": "attr-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						340,
						579,
						560,
						42
					],
					"linecount": 2,
					"text": "@device filters beat packets by player number. @autostart 0 keeps a patch from opening sockets until start/loadbang behavior is wanted."
				}
			},
			{
				"box": {
					"id": "format-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						44,
						628,
						600,
						68
					],
					"linecount": 4,
					"text": "Info outlet formats:\nfound/lost/device <device_number> <device_name> <ip_address>\ndevices <count>\nstatus <running|stopped> <last_bpm> <active_clients>"
				}
			},
			{
				"box": {
					"id": "port-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						44,
						706,
						740,
						36
					],
					"linecount": 2,
					"text": "Network: listens on UDP 50000 for announcements and UDP 50001 for beat packets. macOS build target: 13.3 or later."
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"msg-bang",
						0
					],
					"destination": [
						"obj-beatlink",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"msg-start",
						0
					],
					"destination": [
						"obj-beatlink",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"msg-stop",
						0
					],
					"destination": [
						"obj-beatlink",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"msg-devices",
						0
					],
					"destination": [
						"obj-beatlink",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"msg-status",
						0
					],
					"destination": [
						"obj-beatlink",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beatlink",
						0
					],
					"destination": [
						"mon-beat",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beatlink",
						1
					],
					"destination": [
						"mon-downbeat",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beatlink",
						2
					],
					"destination": [
						"mon-bpm",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beatlink",
						3
					],
					"destination": [
						"mon-beatpos",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beatlink",
						4
					],
					"destination": [
						"mon-device",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beatlink",
						5
					],
					"destination": [
						"mon-pitch",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beatlink",
						6
					],
					"destination": [
						"route-info",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route-info",
						0
					],
					"destination": [
						"prepend-found",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route-info",
						1
					],
					"destination": [
						"prepend-lost",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route-info",
						2
					],
					"destination": [
						"prepend-device",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route-info",
						3
					],
					"destination": [
						"mon-device-count",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route-info",
						4
					],
					"destination": [
						"prepend-status",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route-info",
						5
					],
					"destination": [
						"print-info",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"prepend-found",
						0
					],
					"destination": [
						"mon-found",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"prepend-lost",
						0
					],
					"destination": [
						"mon-lost",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"prepend-device",
						0
					],
					"destination": [
						"mon-device-info",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"prepend-status",
						0
					],
					"destination": [
						"mon-status",
						0
					]
				}
			}
		]
	}
}
