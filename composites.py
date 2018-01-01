import numpy as np
import pylab

def mixtures(fiber, matrix, fiber_volume):
	return fiber * fiber_volume + matrix * (1 - fiber_volume)

def inverse_mixtures(fiber, matrix, fiber_volume):
	return (fiber * matrix) / (matrix * fiber_volume + fiber * (1 - fiber_volume))

def halpin_tsai(fiber, matrix, fiber_volume, xi):
	eta = ((fiber / matrix) - 1) / ((fiber / matrix) + xi)
	return matrix * (1 + eta * xi * fiber_volume) / (1 - eta * fiber_volume)

def hopkins_chamis(fiber, matrix, fiber_volume):
	sqr_vf = math.sqrt(fiber_volume)
	return matrix * ((1 - sqr_vf) + (sqr_vf) / ( 1 - sqr_vf * (1 - matrix / fiber) ))
