"""
Your module documentation here
"""


class CalculatorClass(object):
    """
    Your class documentation here
    """
    def sum(self, num_list):
		
		valor = reduce(lambda x,y:x+y,num_list)
		return valor
		
		
		
sumador = CalculatorClass();

print sumador.sum([1,2,3,4,5]);
