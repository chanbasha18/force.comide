trigger ContactToGroupMemberTrigger on Contact (after insert) {
    List<CollaborationGroupMember> collabmembersToadd = new List<CollaborationGroupMember>();
    List<User> usersToCreate = new List<User>();
    for(Contact con : Trigger.New) {
        User u = new User();
        u.FirstName = con.FirstName;
        u.LastName = con.LastName;
        u.Alias = con.Lastname.subString(1,4);
        u.Username = con.email+'.test';
        u.Email = con.Email;
        u.CommunityNickname = con.Lastname.subString(1,4);
        u.LocaleSidKey = 'en_US';
        u.TimeZoneSidKey = 'GMT';
        u.ProfileID = '00e28000001gHUT';
        u.LanguageLocaleKey = 'en_US';
        u.EmailEncodingKey = 'UTF-8';
        
        usersToCreate.add(u);   
        
        }
        if(usersToCreate.size()>=1){
            insert usersToCreate;
        }
        
        for(User usr : usersToCreate){
            CollaborationGroupMember  collabGroup = new CollaborationGroupMember ();
            collabGroup.CollaborationGroupId  = '0F928000000Puej';
            collabGroup.MemberId = usr.Id;
            collabmembersToadd.add(collabGroup);

        }
        if(collabmembersToadd.size()>=1){
            insert collabmembersToadd;
        }
        
         // Create Chatter Post
         FeedItem testFeed1 = new FeedItem(Body='Welcome', ParentId = '0F928000000Puej', Type='TextPost');
         insert testFeed1;
                
         // Create Chatter Comment
         FeedComment testFeed1Comment = new FeedComment(CommentBody='Thank you', FeedItemId=testFeed1.Id, CommentType='TextComment');
         insert testFeed1Comment;       
    }