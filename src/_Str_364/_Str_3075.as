package _Str_364
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_3075 implements IMessageComposer, IDisposable 
    {
        private var _Str_594:Array;

        public function _Str_3075(k:String)
        {
            this._Str_594 = [];
            super();
            this._Str_594.push(k);
        }

        public function getMessageArray():Array
        {
            return this._Str_594;
        }

        public function dispose():void
        {
            this._Str_594 = null;
        }

        public function get disposed():Boolean
        {
            return this._Str_594 == null;
        }
    }
}
