"""
Your module documentation here
"""
import pdb 

class PrimeClass(object):
    """
    Your class documentation here
    """

    def is_prime(self, num_int):

		
		if num_int > 1:
			
			for i in range(2,num_int):
				if num_int % i == 0:
					return False
			return True
		else:
			return False
			
			
primo = PrimeClass()

print primo.is_prime(977)


      
