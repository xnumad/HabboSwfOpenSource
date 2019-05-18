package _Str_434
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_8691;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7846 implements IMessageParser 
    {
        private var _Str_16047:Array;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            this._Str_16047 = new Array();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_16047.push(new _Str_8691(k));
                _local_3++;
            }
            return true;
        }

        public function get _Str_23742():Array
        {
            return this._Str_16047;
        }
    }
}
