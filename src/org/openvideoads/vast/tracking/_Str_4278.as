package org.openvideoads.vast.tracking
{
    import org.openvideoads.base.Debuggable;

    public class _Str_4278 extends Debuggable 
    {
        protected static const _Str_16850:String = "BA EA 1Q HW 3Q CS CE SN HN EC DC TN";

        protected var _Str_5970:Number;
        protected var _Str_2467:Number;
        protected var _Str_6324:String;
        protected var _Str_22415:String = "TM BA EA 1Q HW 3Q SN HN NS NE TN";

        public function _Str_4278(k:Number, _arg_2:Number=0, _arg_3:String=null)
        {
            this._Str_5970 = k;
            this._Str_2467 = _arg_2;
            this._Str_6324 = _arg_3;
        }

        public function _Str_26042():Boolean
        {
            return this._Str_22415.indexOf(this.label) > -1;
        }

        public function _Str_23283():Boolean
        {
            return _Str_16850.indexOf(this._Str_6324) > -1;
        }

        public function get milliseconds():Number
        {
            return this._Str_5970;
        }

        public function get seconds():Number
        {
            return this._Str_5970 / 1000;
        }

        public function get duration():Number
        {
            return this._Str_2467;
        }

        public function get label():String
        {
            return this._Str_6324;
        }

        public function toString():String
        {
            return ((((("TimeEvent(time point: " + this._Str_5970) + ", label: ") + this._Str_6324) + ", duration: ") + this._Str_2467) + ")";
        }
    }
}
