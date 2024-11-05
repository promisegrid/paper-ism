// graph.scad
// OpenSCAD script to visualize a 3D hypergraph with nodes as spheres and edges as thin extrusions along curves.

$fn = 20; // Increase the resolution for smoother spheres and curves

pi = 3.14159265358979323846;

// Define node positions
nodes = [
    [0, 0, 0],
    [50, 0, 0],
    [25, 43.3, 0],
    [25, 14.43, 43.3],
    [25, 14.43, -43.3]
];

// Define edges as pairs of node indices
edges = [
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 2],
    [1, 3],
    [2, 3],
    [2, 4],
    [3, 4]
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

// Function to create edges as extrusions along curves
module create_edges() {
    color("blue")
    for (edge = edges) {
        start = nodes[edge[0]];
        end = nodes[edge[1]];
        draw_edge(start, end);
    }
}

// Function to draw a single edge with a smooth curve using a circular extrusion
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

    // Extrude a circle along the polyline to create the edge 
    for (i = [0 : steps - 1]) {
        p_current = curve_points[i];
        p_next = curve_points[i + 1];
        direction = [
            p_next[0] - p_current[0],
            p_next[1] - p_current[1],
            p_next[2] - p_current[2]
        ];
        length = sqrt(direction[0]^2 + direction[1]^2 + direction[2]^2);
        // Position and orient the segment
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

// Main assembly
module hypergraph() {
    create_edges();
    create_nodes();
}

// Render the hypergraph
hypergraph();
