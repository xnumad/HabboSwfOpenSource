package org.openvideoads.vast.tracking
{
    public class _Str_2460 
    {
        protected var _Str_5970:Number;
        protected var _Str_6324:String;
        protected var _id:String;
        protected var _Str_18606:Boolean = false;

        public function _Str_2460(k:Number, _arg_2:String, _arg_3:String=null)
        {
            this._Str_5970 = k;
            this._Str_6324 = _arg_2;
            this._id = _arg_3;
        }

        public function get milliseconds():Number
        {
            return this._Str_5970;
        }

        public function get seconds():Number
        {
            return this._Str_5970 / 1000;
        }

        public function get label():String
        {
            return this._Str_6324;
        }

        public function get id():String
        {
            return this._id;
        }

        public function set _Str_20299(k:Boolean):void
        {
            this._Str_18606 = k;
        }

        public function get _Str_20299():Boolean
        {
            return this._Str_18606;
        }

        public function get type():String
        {
            if (this.label != null)
            {
                return this.label.substr(0, 2);
            }
            return null;
        }

        public function repeatable():Boolean
        {
            var k:String = "SN HN EC DC CS CE DS HS";
            return k.indexOf(this.type) > -1;
        }

        public function isLinear():Boolean
        {
            var k:String = "BS ES BA EA DS HS 1Q HW 3Q CS CE SN HN EC DC TN";
            return k.indexOf(this.type) > -1;
        }

        public function isNonLinear():Boolean
        {
            var k:String = "NS NE CS CE";
            return k.indexOf(this.type) > -1;
        }

        public function toString():String
        {
            return ((((("TrackingPoint(time point: " + this._Str_5970) + ", label: ") + this._Str_6324) + ", isForLinearChild:") + this._Str_18606) + ")";
        }
    }
}
