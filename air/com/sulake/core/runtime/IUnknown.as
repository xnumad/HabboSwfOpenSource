//com.sulake.core.runtime.IUnknown

package com.sulake.core.runtime{
    public /*dynamic*/ interface IUnknown extends IDisposable {

        function queueInterface(k:IID, _arg_2:Function=null):IUnknown;
        function release(k:IID):uint;

    }
}//package com.sulake.core.runtime

