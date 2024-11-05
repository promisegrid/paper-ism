// graph.scad
// OpenSCAD script to visualize a 3D hypergraph with nodes as spheres and edges as thin extrusions along curves.
// Includes a time arrow representation.

$fn = 20; // Increase the resolution for smoother spheres and curves

pi = 3.14159265358979323846;

// Define node positions with 20 nodes
// X, Y, Z coordinates are positive random integers between 0 and 100
// Z coordinates are monotonically increasing

nodes = [
    [12,  45,   5],
    [23,  67,  10],
    [34,  12,  15],
    [45,  89,  20],
    [56,  34,  25],
    [67,  56,  30],
    [78,  78,  35],
    [89,  90,  40],
    [90,  23,  45],
    [81,  34,  50],
    [72,  55,  55],
    [63,  66,  60],
    [54,  77,  65],
    [45,  88,  70],
    [36,  99,  75],
    [27,  11,  80],
    [18,  22,  85],
    [9,   33,  90],
    [5,   44,  95],
    [2,   55, 100]
];

// Define edges as pairs of node indices
edges = [
    [0, 1],
    [1, 2],
    [2, 3],
    [3, 4],
    [4, 5],
    [5, 6],
    [6, 7],
    [7, 8],
    [8, 9],
    [9, 10],
    [10, 11],
    [11, 12],
    [12, 13],
    [13, 14],
    [14, 15],
    [15, 16],
    [16, 17],
    [17, 18],
    [0, 18],
    [5, 15],
    [3, 12],
    [7, 14],
    [10, 16]
];

// Parameters
node_radius = 5; // 5mm radius for 10mm diameter
edge_radius = 0.5; // 0.5mm radius for 1mm diameter

// Function to create a sphere for each node
module create_nodes() {
    color("red")
    for (node = nodes) {
        translate(node)
            sphere(r = node_radius);
    }
}

module create_edges() {
    color("blue")
    for (edge = edges) {
        start = nodes[edge[0]];
        end = nodes[edge[1]];
        draw_edge(start, end);
    }
}

// Function to draw a single edge with a smooth curve 
module draw_edge(p1, p2) {
    // Calculate the midpoint for curvature
    mid = [
        (p1[0] + p2[0])/2 + 10,
        (p1[1] + p2[1])/2 + 10,
        (p1[2] + p2[2])/2
    ];

    // Points for the quadratic Bezier curve
    path = [p1, mid, p2];

    // Generate points along the curve
    steps = 100;
    curve_points = [for (i = [0 : steps]) 
                    let(t = i / steps) bezier_point(t, path[0], path[1], path[2])];

    // Create a polyline from the curve points
    polyline = curve_points;

    // place spheres along the curve
    for (i = [0 : steps - 1]) {
        p_current = curve_points[i];
        p_next = curve_points[i + 1];
        direction = [
            p_next[0] - p_current[0],
            p_next[1] - p_current[1],
            p_next[2] - p_current[2]
        ];
        length = sqrt(direction[0]^2 + direction[1]^2 + direction[2]^2);
        translate(p_current)
            sphere(r = edge_radius);
    }
}

// Function to calculate a point on a quadratic Bezier curve
function bezier_point(t, p0, p1, p2) = 
    [
        (1 - t)^2 * p0[0] + 2*(1 - t)*t * p1[0] + t^2 * p2[0],
        (1 - t)^2 * p0[1] + 2*(1 - t)*t * p1[1] + t^2 * p2[1],
        (1 - t)^2 * p0[2] + 2*(1 - t)*t * p1[2] + t^2 * p2[2]
    ];

// Calculate N as the maximum Z coordinate of all nodes
N = max([for (node = nodes) node[2]]);

// Function to create the time arrow
module create_time_arrow() {
    color("black") {
        // Base position for the time arrow
        translate([-5, -5, 0]) {
            // Cylinder: N units long along +Z, 1 unit in diameter
            cylinder(h = N, d = 1, center = false);
            
            // Cone: N/10 units long, N/15 units in diameter at the base, at +Z end of the cylinder
            translate([0, 0, N])
                cylinder(h = N/10, d1 = N/15, d2 = 0, center = false);
        }
    }
}

// Main assembly
module hypergraph() {
    create_edges();
    create_nodes();
    create_time_arrow();
}

// Render the hypergraph
hypergraph();
