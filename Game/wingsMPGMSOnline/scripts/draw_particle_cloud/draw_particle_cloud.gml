///@function draw_particle_cloud(xmin,xmax,ymin,ymax,depth,value);

function draw_particle_cloud(xmin,xmax,ymin,ymax,_depth,value)
{
	
part_emitter_region(ps_bkgclouds, pe_bkgclouds, xmin, xmax, ymin, ymax, ps_shape_rectangle, ps_distr_gaussian);
part_emitter_burst(ps_bkgclouds, pe_bkgclouds, pt_bkgclouds, value);
part_system_depth(ps_bkgclouds, _depth);

}