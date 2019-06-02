package com.sulake.habbo.communication.messages.incoming.nux
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class NewUserExperienceGiftOptions 
    {
        private var _dayIndex:int;
        private var _stepIndex:int;
        private var _options:Vector.<NewUserExperienceGift>;

        public function NewUserExperienceGiftOptions(k:IMessageDataWrapper)
        {
            this._dayIndex = k.readInteger();
            this._stepIndex = k.readInteger();
            this._options = new Vector.<NewUserExperienceGift>(0);
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._options.push(new NewUserExperienceGift(k));
                _local_3++;
            }
        }

        public function get dayIndex():int
        {
            return this._dayIndex;
        }

        public function get stepIndex():int
        {
            return this._stepIndex;
        }

        public function get options():Vector.<NewUserExperienceGift>
        {
            return this._options;
        }
    }
}
