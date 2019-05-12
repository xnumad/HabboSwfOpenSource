package _Str_411
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12037 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_12037(k:String)
        {
            this._Str_594 = new Array();
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
    }
}
