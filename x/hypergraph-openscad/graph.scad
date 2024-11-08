// graph.scad
// OpenSCAD script to visualize a 3D hypergraph with nodes as spheres and edges as thin extrusions along curves.
// Includes a time arrow representation.

$fn = 20; // Increase the resolution for smoother spheres and curves

pi = 3.14159265358979323846;

// Define node positions with 30 nodes
// X, Y coordinates are random integers between 0 and 100
// Z coordinates are randomly increasing from 0 to 200

nodes = [
    [12, 45, 2],
    [30, 70, 6],
    [15, 30, 9],
    [40, 85, 15],
    [25, 40, 19],
    [60, 30, 24],
    [30, 75, 29],
    [80, 30, 35],
    [25, 25, 39],
    [78, 35, 43],
    [48, 50, 48],
    [13, 65, 54],
    [58, 42, 60],
    [50, 85, 65],
    [42, 15, 72],
    [35, 55, 78],
    [50, 25, 83],
    [10, 75, 89],
    [55, 45, 95],
    [20, 60, 101],
    [65, 20, 108],
    [85, 50, 115],
    [40, 80, 123],
    [70, 35, 130],
    [25, 55, 138],
    [75, 40, 145],
    [35, 65, 153],
    [60, 50, 160],
    [15, 85, 168],
    [80, 45, 175]
];

// Define edges ensuring each node has between 2 to 4 connections
edges = [
    [0, 1], [0, 5], [0, 18],
    [1, 2], [1, 6], [1, 19],
    [2, 3], [2, 7],
    [3, 4], [3, 8], [3, 20],
    [4, 5], [4, 9],
    [5, 6], [5, 10],
    [6, 7], [6, 11],
    [7, 8], [7, 12],
    [8, 9], [8, 13],
    [9, 10], [9, 14],
    [10, 11], [10, 15],
    [11, 12], [11, 16],
    [12, 13], [12, 17],
    [13, 14], [13, 18],
    [14, 15], [14, 19],
    [15, 16], [15, 20],
    [16, 17], [16, 21],
    [17, 18], [17, 22],
    [18, 19], [18, 23],
    [19, 20], [19, 24],
    [20, 21], [20, 25],
    [21, 22], [21, 26],
    [22, 23], [22, 27],
    [23, 24], [23, 28],
    [24, 25], [24, 29],
    [25, 26], [25, 28],
    [26, 27], [26, 29],
    [27, 28], [28, 29]
];

// Parameters
node_radius = 3; // 3mm radius for 6mm diameter
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
