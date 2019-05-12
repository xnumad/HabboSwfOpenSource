package snowwar._Str_62
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_2467 extends SnowWarGameObjectData 
    {
        public static const _SafeStr_12576:int = 19;

        private var _name:String;
        private var _SafeStr_12577:String;
        private var _figure:String;
        private var _SafeStr_7874:String;

        public function _SafeStr_2467(k:int, _arg_2:int)
        {
            super(k, _arg_2);
        }

        public function get name():String
        {
            return this._name;
        }

        public function get _SafeStr_12578():String
        {
            return this._SafeStr_12577;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get _SafeStr_7885():String
        {
            return this._SafeStr_7874;
        }

        override public function parse(k:IMessageDataWrapper):void
        {
            _SafeStr_12575(k, _SafeStr_12576);
            this._name = k.readString();
            this._SafeStr_12577 = k.readString();
            this._figure = k.readString();
            this._SafeStr_7874 = k.readString();
            Logger.log(("Parsed human game object data, variables:" + _SafeStr_12573));
        }

        public function get x():int
        {
            return getVariable(2);
        }

        public function get y():int
        {
            return getVariable(3);
        }

        public function get _SafeStr_12581():int
        {
            return getVariable(4);
        }

        public function get _SafeStr_12582():int
        {
            return getVariable(5);
        }

        public function get _SafeStr_12583():int
        {
            return getVariable(6);
        }

        public function get _SafeStr_12584():int
        {
            return getVariable(7);
        }

        public function get _SafeStr_12585():int
        {
            return getVariable(8);
        }

        public function get _SafeStr_12586():int
        {
            return getVariable(9);
        }

        public function get _SafeStr_12587():int
        {
            return getVariable(10);
        }

        public function get _SafeStr_12588():int
        {
            return getVariable(11);
        }

        public function get _SafeStr_12589():int
        {
            return getVariable(12);
        }

        public function get _SafeStr_12590():int
        {
            return getVariable(13);
        }

        public function get _SafeStr_12591():int
        {
            return getVariable(14);
        }

        public function get _SafeStr_12592():int
        {
            return getVariable(15);
        }

        public function get score():int
        {
            return getVariable(16);
        }

        public function get team():int
        {
            return getVariable(17);
        }

        public function get userId():int
        {
            return getVariable(18);
        }
    }
}
