package com.sulake.habbo.communication.messages.parser.callforhelp
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CallForHelpCategoryData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class CfhTopicsInitMessageParser implements IMessageParser 
    {
        private var _callForHelpCategories:Vector.<CallForHelpCategoryData>;
        private var _disposed:Boolean;


        public function flush():Boolean
        {
            var k:CallForHelpCategoryData;
            if (this._disposed)
            {
                return true;
            }
            this._disposed = true;
            for each (k in this._callForHelpCategories)
            {
                k.dispose();
            }
            this._callForHelpCategories = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._callForHelpCategories = new Vector.<CallForHelpCategoryData>();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._callForHelpCategories.push(new CallForHelpCategoryData(k));
                _local_3++;
            }
            return true;
        }

        public function get _Str_9001():Vector.<CallForHelpCategoryData>
        {
            return this._callForHelpCategories;
        }
    }
}
