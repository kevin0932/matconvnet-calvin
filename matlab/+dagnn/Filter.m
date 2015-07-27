classdef Filter < dagnn.Layer
  properties
    pad = [0 0 0 0]
    stride = [1 1]
  end
  methods
    function set.pad(obj, pad)
      if numel(pad) == 1
        obj.pad = [pad pad pad pad] ;
      elseif numel(pad) == 2
        obj.pad = pad([1 1 2 2]) ;
      else
        obj.pad = pad ;
      end
    end
    
    function set.stride(obj, stride)
      if numel(stride) == 1
        obj.stride = [stride stride] ;
      else
        obj.stride = stride ;
      end
    end
    
    function kernelSize = getKernelSize(obj)
      kernelSize = [1 1] ;
    end
    
    function outputSizes = getOutputSizes(obj, inputSizes)
      ks = obj.getKernelSize() ;
      outputSizes{1} = [...
        fix((inputSizes{1}(1) + obj.pad(1) + obj.pad(3) - ks(1) + 1) / obj.stride(1)), ...
        fix((inputSizes{1}(2) + obj.pad(2) + obj.pad(4) - ks(2) + 1) / obj.stride(2)), ...
        1, ...
        inputSizes{1}(4)] ;
    end
  end
end