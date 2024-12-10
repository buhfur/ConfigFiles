#!/usr/bin/env python3
import sys 
# Short script to calculate sales tax from an unknown list of CLI arguments 

'''
Usage : 

    st.py num1...numx 

OUTPUT :

    Before Tax : <class: 'int'> 
    Total : <class: 'int'> 
    

'''


def tax():
    # total Price w/ Tax = list price * ( 1 + sales tax rate )
    sales_tax_rate = float(0.07)
    total = float(0.0)
    before_tax = float(0.0)

    for list_price in sys.argv[1:]:
        before_tax+=float(list_price)
        total+= (float(list_price) * 1.07)

    print(f"Total : {round(total, 2)}")
    print(f"Pre-tax : {round(before_tax, 2)}")


if __name__ == '__main__' : 
    tax()
