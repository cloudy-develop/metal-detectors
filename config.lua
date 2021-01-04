config = {

	players = {
		{ fivemId = nil, detectors = { 1, 2, 3 } },
		{ fivemId = nil, detectors = { 4 } }
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
			entity = { enable = true, heading = 117.50 }
		}
	},

	printFivemId = false, -- Prints players FiveM ID when they join in the server console.
	debug = false -- Prints debug information for trouble shooting.

}

-- Config Information --

-- "players" --
-- "fivemId" = The FiveM ID of the player you want to give access.
-- "detectors" = A list of detector id's that you want to give the player access to.

-- "detectors" --
-- "info/id" = The id of the metal detector. (They cannot be the same!)
-- "info/sound/range" = The range that you want to alarm to be heard.
-- "coords/x" = The 'x' coordinate of the metal detector.
-- "coords/y" = The 'y' coordinate of the metal detector.
-- "coords/z" = The 'z' coordinate of the metal detector.
-- "coords/radius" = The radius of the metal detector to start scanning them.
-- "entity/enable" = If 'true' this creates a metal detector at the coords defined above.
-- "entity/heading" = If "entity/enable" is 'true' this sets the heading of the metal detector. (Set to 'nil' if "entity/enable" is 'false'.)