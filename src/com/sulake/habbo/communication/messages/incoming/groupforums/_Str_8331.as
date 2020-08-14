package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.ForumDataMessageParser;

    public class _Str_8331 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8331(k:Function)
        {
            super(k, ForumDataMessageParser);
        }

        public function getParser():ForumDataMessageParser
        {
            return this._parser as ForumDataMessageParser;
        }
    }
}
