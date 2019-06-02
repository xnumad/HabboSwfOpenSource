//com.sulake.habbo.communication.messages.parser.groupforums.ForumDataMessageParser

package com.sulake.habbo.communication.messages.parser.groupforums{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ForumDataMessageParser implements IMessageParser {

        private var _forumData:ExtendedForumData;

        public function ForumDataMessageParser();

        public function get forumData():ExtendedForumData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.groupforums

