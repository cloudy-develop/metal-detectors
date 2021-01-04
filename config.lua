config = {

	players = {
		{ id = nil, detectors = { 1, 2, 3 } },
		{ id = nil, detectors = { 4 } }
	},

    detectors = {
		{ -- Adds Metal Detector at FIB Headquarters (Without Entity).
			info = { id = 1, sound = { range = 5 } },
			coords = { x = 116.02, y = -755.07, z = 45.75, radius = 0.5 },
			entity = { enable = false, heading = nil }
		},
		{ -- Adds Metal Detector at FIB Headquarters (Without Entity).
			info = { id = 2, sound = { range = 5 } },
			coords = { x = 115.59, y = -756.26, z = 45.75, radius = 0.5 },
			entity = { enable = false, heading = nil }
		},
		{ -- Adds Metal Detector at FIB Headquarters (Without Entity).
			info = { id = 3, sound = { range = 5 } },
			coords = { x = 115.11, y = -757.40, z = 45.75, radius = 0.5 },
			entity = { enable = false, heading = nil }
		},
		{ -- Adds Metal Detector at Lifeinvader (With Entity).
			info = { id = 4, sound = { range = 5 } },
			coords = { x = -1073.40, y = -249.55, z = 37.76, radius = 0.5 },
			entity = { enable = true, heading = 117.00 }
		}
	},

	debug = true

}