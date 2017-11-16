classdef polynomial
    %POLYNOMIAL  Class for handling polynomials and operations
    
    properties (GetAccess=public,SetAccess=private)
        coeffs=0;
        order =0;
    end
    
    methods
        function  self = polynomial(arg1)
            
            % Return empty if no arguments
            if nargin == 0
                return;
            end
            
            % Copy constructor if arg1 polynomial
            if isa(arg1,'polynomial')
                self.coeffs = arg1.coeffs;
                self.order  = arg1.order;
                return;
            end
            
            % Otherwise, arg1 is coeffs vector
            lastnnz = find(arg1 ~= 0,1,'last');
            if isempty(lastnnz), lastnnz = 1; end;
            self.coeffs = arg1(1:lastnnz);
            self.coeffs = self.coeffs(:)';
            self.order  = length(self.coeffs)-1;

        end
        
        function  [poly] = uplus(poly1)
            poly=poly1;
        end
        
        function  [poly3] = plus(poly1,poly2)
            
            max_order=max(poly1.order,poly2.order);
            poly3 = polynomial([poly1.coeffs,zeros(1,max_order-poly1.order)] + ...
                               [poly2.coeffs,zeros(1,max_order-poly2.order)]);
            
        end
        
        function  [poly] = uminus(poly1)
            poly=polynomial(-poly1.coeffs);
        end
        
        function  [poly3] = minus(poly1,poly2)
            
            max_order=max(poly1.order,poly2.order);
            poly3 = polynomial([poly1.coeffs,zeros(1,max_order-poly1.order)] - ...
                               [poly2.coeffs,zeros(1,max_order-poly2.order)]);
           
        end
        
        function  [poly] = mtimes(a,b)
            
            if strcmpi(class(a),'polynomial') && strcmpi(class(b),'polynomial')
                poly = polynomial(conv(a.coeffs,b.coeffs));
            elseif strcmpi(class(a),'polynomial') && strcmpi(class(b),'double')
                poly = polynomial(b*a.coeffs);
            elseif strcmpi(class(b),'polynomial') && strcmpi(class(a),'double')
                poly = polynomial(a*b.coeffs);
            end
            
        end
        
        function  [poly] = mpower(poly1,b)
            
            if b == 0
                poly = polynomial(1);
                return;
            elseif b == 1
                poly = poly1;
                return;
            end
            
            if ~(isa(poly1,'polynomial') && isa(b,'double') && b >= 0 && round(b) == b)
                error('mpower requires polynomial and integer');
            end
            poly = polynomial(poly1);
            for i = 1:b-1
                poly = poly*poly1;
            end
            
        end
            
        function  [iseq] = eq(poly1,poly2)
            
            iseq = iszero(poly1-poly2);
            
        end
        
        function  [tf] = iszero(poly)
            
            tf = all(poly.coeffs == 0);
            
        end
        
        function  [poly1] = integrate(poly,const)
            
            if nargin < 2
                c=0;
            else
                c = const;
            end;
            factors = [c,1./(1:poly.order+1)];
            poly1   = polynomial(factors.*[1,poly.coeffs]);
            
        end

        function  [poly1] = differentiate(poly)
            
            if iszero(poly), poly1=poly; return; end;
            
            factors = 1:poly.order;
            poly1   = polynomial(factors.*poly.coeffs(2:end));
            
        end
        
        function  [y] = evaluate(poly,x)
            y = polyval(fliplr(poly.coeffs),x);
        end
        
        function  ax = plot_it(poly,x,pstr,ax)
            
            if nargin < 4, fig=figure(); ax = axes(); end;
            plot(ax,x,evaluate(poly,x),pstr{:});
            
        end
        
        function [] = disp(poly)
            
            for p = 1:length(poly)
                for i = 1:poly(p).order+1
                    if i == 1
                        fprintf('%5.4f',poly(p).coeffs(i));
                    elseif i == 2
                        fprintf(' + %5.4f x',poly(p).coeffs(i));
                    else
                        fprintf(' + %5.4f x^%i',poly(p).coeffs(i),i-1);
                    end
                end
                fprintf('\n');
            end
            
        end
    end
    
end