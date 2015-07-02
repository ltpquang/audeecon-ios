/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at
 
 http://aws.amazon.com/apache2.0
 
 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSSESResources.h"
#import "AWSLogging.h"

@interface AWSSESResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSESResources

+ (instancetype)sharedInstance {
    static AWSSESResources *_sharedResources = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSESResources new];
    });
    
    return _sharedResources;
}
- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @" \
    { \
      \"version\":\"2.0\", \
      \"metadata\":{ \
        \"apiVersion\":\"2010-12-01\", \
        \"endpointPrefix\":\"email\", \
        \"serviceAbbreviation\":\"Amazon SES\", \
        \"serviceFullName\":\"Amazon Simple Email Service\", \
        \"signatureVersion\":\"v4\", \
        \"signingName\":\"ses\", \
        \"xmlNamespace\":\"http://ses.amazonaws.com/doc/2010-12-01/\", \
        \"protocol\":\"query\" \
      }, \
      \"documentation\":\"<fullname>Amazon Simple Email Service</fullname> <p> This is the API Reference for Amazon Simple Email Service (Amazon SES). This documentation is intended to be used in conjunction with the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html\\\">Amazon SES Developer Guide</a>. </p> <note>For a list of Amazon SES endpoints to use in service requests, see <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html\\\">Regions and Amazon SES</a> in the Amazon SES Developer Guide. </note>\", \
      \"operations\":{ \
        \"DeleteIdentity\":{ \
          \"name\":\"DeleteIdentity\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"DeleteIdentityRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to delete an identity from the list of identities for the AWS Account.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"DeleteIdentityResponse\", \
            \"documentation\":\"<p>An empty element. Receiving this element indicates that the request completed successfully.</p>\", \
            \"resultWrapper\":\"DeleteIdentityResult\" \
          }, \
          \"documentation\":\"<p>Deletes the specified identity (email address or domain) from the list of verified identities.</p> <p>This action is throttled at one request per second.</p>\" \
        }, \
        \"DeleteVerifiedEmailAddress\":{ \
          \"name\":\"DeleteVerifiedEmailAddress\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"DeleteVerifiedEmailAddressRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to delete an address from the list of verified email addresses.</p>\" \
          }, \
          \"documentation\":\"<p>Deletes the specified email address from the list of verified addresses.</p> <important>The DeleteVerifiedEmailAddress action is deprecated as of the May 15, 2012 release of Domain Verification. The DeleteIdentity action is now preferred.</important> <p>This action is throttled at one request per second.</p>\" \
        }, \
        \"GetIdentityDkimAttributes\":{ \
          \"name\":\"GetIdentityDkimAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"GetIdentityDkimAttributesRequest\", \
            \"documentation\":\"<p>Given a list of verified identities, describes their DKIM attributes. The DKIM attributes of an email address identity includes whether DKIM signing is individually enabled or disabled for that address. The DKIM attributes of a domain name identity includes whether DKIM signing is enabled, as well as the DNS records (tokens) that must remain published in the domain name's DNS.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"GetIdentityDkimAttributesResponse\", \
            \"documentation\":\"<p>Represents a list of all the DKIM attributes for the specified identity.</p>\", \
            \"resultWrapper\":\"GetIdentityDkimAttributesResult\" \
          }, \
          \"documentation\":\"<p>Returns the current status of Easy DKIM signing for an entity. For domain name identities, this action also returns the DKIM tokens that are required for Easy DKIM signing, and whether Amazon SES has successfully verified that these tokens have been published.</p> <p>This action takes a list of identities as input and returns the following information for each:</p> <ul> <li>Whether Easy DKIM signing is enabled or disabled.</li> <li>A set of DKIM tokens that represent the identity. If the identity is an email address, the tokens represent the domain of that address.</li> <li>Whether Amazon SES has successfully verified the DKIM tokens published in the domain's DNS. This information is only returned for domain name identities, not for email addresses.</li> </ul> <p>This action is throttled at one request per second.</p> <p>For more information about creating DNS records using DKIM tokens, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html\\\">Amazon SES Developer Guide</a>.</p>\" \
        }, \
        \"GetIdentityNotificationAttributes\":{ \
          \"name\":\"GetIdentityNotificationAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"GetIdentityNotificationAttributesRequest\"}, \
          \"output\":{ \
            \"shape\":\"GetIdentityNotificationAttributesResponse\", \
            \"documentation\":\"<p>Describes whether an identity has Amazon Simple Notification Service (Amazon SNS) topics set for bounce, complaint, and/or delivery notifications, and specifies whether feedback forwarding is enabled for bounce and complaint notifications.</p>\", \
            \"resultWrapper\":\"GetIdentityNotificationAttributesResult\" \
          }, \
          \"documentation\":\"<p>Given a list of verified identities (email addresses and/or domains), returns a structure describing identity notification attributes.</p> <p>This action is throttled at one request per second.</p> <p>For more information about using notifications with Amazon SES, see the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html\\\">Amazon SES Developer Guide</a>.</p>\" \
        }, \
        \"GetIdentityVerificationAttributes\":{ \
          \"name\":\"GetIdentityVerificationAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"GetIdentityVerificationAttributesRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to provide the verification attributes for a list of identities.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"GetIdentityVerificationAttributesResponse\", \
            \"documentation\":\"<p>Represents the verification attributes for a list of identities.</p>\", \
            \"resultWrapper\":\"GetIdentityVerificationAttributesResult\" \
          }, \
          \"documentation\":\"<p>Given a list of identities (email addresses and/or domains), returns the verification status and (for domain identities) the verification token for each identity.</p> <p>This action is throttled at one request per second.</p>\" \
        }, \
        \"GetSendQuota\":{ \
          \"name\":\"GetSendQuota\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"output\":{ \
            \"shape\":\"GetSendQuotaResponse\", \
            \"documentation\":\"<p>Represents the user's current activity limits returned from a successful <code>GetSendQuota</code> request. </p>\", \
            \"resultWrapper\":\"GetSendQuotaResult\" \
          }, \
          \"documentation\":\"<p>Returns the user's current sending limits.</p> <p>This action is throttled at one request per second.</p>\" \
        }, \
        \"GetSendStatistics\":{ \
          \"name\":\"GetSendStatistics\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"output\":{ \
            \"shape\":\"GetSendStatisticsResponse\", \
            \"documentation\":\"<p>Represents a list of <code>SendDataPoint</code> items returned from a successful <code>GetSendStatistics</code> request. This list contains aggregated data from the previous two weeks of sending activity. </p>\", \
            \"resultWrapper\":\"GetSendStatisticsResult\" \
          }, \
          \"documentation\":\"<p>Returns the user's sending statistics. The result is a list of data points, representing the last two weeks of sending activity. </p> <p>Each data point in the list contains statistics for a 15-minute interval.</p> <p>This action is throttled at one request per second.</p>\" \
        }, \
        \"ListIdentities\":{ \
          \"name\":\"ListIdentities\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"ListIdentitiesRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to list all identities for the AWS Account.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"ListIdentitiesResponse\", \
            \"documentation\":\"<p>Represents a list of all verified identities for the AWS Account.</p>\", \
            \"resultWrapper\":\"ListIdentitiesResult\" \
          }, \
          \"documentation\":\"<p>Returns a list containing all of the identities (email addresses and domains) for a specific AWS Account, regardless of verification status.</p> <p>This action is throttled at one request per second.</p>\" \
        }, \
        \"ListVerifiedEmailAddresses\":{ \
          \"name\":\"ListVerifiedEmailAddresses\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"output\":{ \
            \"shape\":\"ListVerifiedEmailAddressesResponse\", \
            \"documentation\":\"<p>Represents a list of all the email addresses verified for the current user.</p>\", \
            \"resultWrapper\":\"ListVerifiedEmailAddressesResult\" \
          }, \
          \"documentation\":\"<p>Returns a list containing all of the email addresses that have been verified.</p> <important>The ListVerifiedEmailAddresses action is deprecated as of the May 15, 2012 release of Domain Verification. The ListIdentities action is now preferred.</important> <p>This action is throttled at one request per second.</p>\" \
        }, \
        \"SendEmail\":{ \
          \"name\":\"SendEmail\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"SendEmailRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to send a single email message.</p> <p>This datatype can be used in application code to compose a message consisting of source, destination, message, reply-to, and return-path parts. This object can then be sent using the <code>SendEmail</code> action. </p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"SendEmailResponse\", \
            \"documentation\":\"<p>Represents a unique message ID returned from a successful <code>SendEmail</code> request. </p>\", \
            \"resultWrapper\":\"SendEmailResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"MessageRejected\", \
              \"error\":{ \
                \"code\":\"MessageRejected\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"Indicates that the action failed, and the message could not be sent. Check the error stack for more information about what caused the error.\" \
            } \
          ], \
          \"documentation\":\"<p>Composes an email message based on input data, and then immediately queues the message for sending. </p> <important> You can only send email from verified email addresses and domains. If you have not requested production access to Amazon SES, you must also verify every recipient email address except for the recipients provided by the Amazon SES mailbox simulator. For more information, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">Amazon SES Developer Guide</a>. </important> <p>The total size of the message cannot exceed 10 MB.</p> <p>Amazon SES has a limit on the total number of recipients per message: The combined number of To:, CC: and BCC: email addresses cannot exceed 50. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call Amazon SES repeatedly to send the message to each group. </p> <p>For every message that you send, the total number of recipients (To:, CC: and BCC:) is counted against your <i>sending quota</i> - the maximum number of emails you can send in a 24-hour period. For information about your sending quota, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html\\\">Amazon SES Developer Guide</a>. </p>\" \
        }, \
        \"SendRawEmail\":{ \
          \"name\":\"SendRawEmail\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"SendRawEmailRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to send a raw email message.</p> <p>This datatype can be used in application code to compose a message consisting of source, destination, and raw message text. This object can then be sent using the <code>SendRawEmail</code> action. </p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"SendRawEmailResponse\", \
            \"documentation\":\"<p>Represents a unique message ID returned from a successful <code>SendRawEmail</code> request. </p>\", \
            \"resultWrapper\":\"SendRawEmailResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"MessageRejected\", \
              \"error\":{ \
                \"code\":\"MessageRejected\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"Indicates that the action failed, and the message could not be sent. Check the error stack for more information about what caused the error.\" \
            } \
          ], \
          \"documentation\":\"<p>Sends an email message, with header and content specified by the client. The <code>SendRawEmail</code> action is useful for sending multipart MIME emails. The raw text of the message must comply with Internet email standards; otherwise, the message cannot be sent. </p> <important> You can only send email from verified email addresses and domains. If you have not requested production access to Amazon SES, you must also verify every recipient email address except for the recipients provided by the Amazon SES mailbox simulator. For more information, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">Amazon SES Developer Guide</a>. </important> <p>The total size of the message cannot exceed 10 MB. This includes any attachments that are part of the message.</p> <p>Amazon SES has a limit on the total number of recipients per message: The combined number of To:, CC: and BCC: email addresses cannot exceed 50. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call Amazon SES repeatedly to send the message to each group. </p> <p>The To:, CC:, and BCC: headers in the raw message can contain a group list. Note that each recipient in a group list counts towards the 50-recipient limit. </p> <p>For every message that you send, the total number of recipients (To:, CC: and BCC:) is counted against your <i>sending quota</i> - the maximum number of emails you can send in a 24-hour period. For information about your sending quota, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html\\\">Amazon SES Developer Guide</a>. </p>\" \
        }, \
        \"SetIdentityDkimEnabled\":{ \
          \"name\":\"SetIdentityDkimEnabled\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"SetIdentityDkimEnabledRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to enable or disable DKIM signing for an identity.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"SetIdentityDkimEnabledResponse\", \
            \"documentation\":\"<p>An empty element. Receiving this element indicates that the request completed successfully.</p>\", \
            \"resultWrapper\":\"SetIdentityDkimEnabledResult\" \
          }, \
          \"documentation\":\"<p>Enables or disables Easy DKIM signing of email sent from an identity:</p> <ul> <li>If Easy DKIM signing is enabled for a domain name identity (e.g., <code>example.com</code>), then Amazon SES will DKIM-sign all email sent by addresses under that domain name (e.g., <code>user@example.com</code>).</li> <li>If Easy DKIM signing is enabled for an email address, then Amazon SES will DKIM-sign all email sent by that email address.</li> </ul> <p>For email addresses (e.g., <code>user@example.com</code>), you can only enable Easy DKIM signing if the corresponding domain (e.g., <code>example.com</code>) has been set up for Easy DKIM using the AWS Console or the <code>VerifyDomainDkim</code> action.</p> <p>This action is throttled at one request per second.</p> <p>For more information about Easy DKIM signing, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Amazon SES Developer Guide</a>.</p>\" \
        }, \
        \"SetIdentityFeedbackForwardingEnabled\":{ \
          \"name\":\"SetIdentityFeedbackForwardingEnabled\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"SetIdentityFeedbackForwardingEnabledRequest\"}, \
          \"output\":{ \
            \"shape\":\"SetIdentityFeedbackForwardingEnabledResponse\", \
            \"documentation\":\"<p>An empty element. Receiving this element indicates that the request completed successfully.</p>\", \
            \"resultWrapper\":\"SetIdentityFeedbackForwardingEnabledResult\" \
          }, \
          \"documentation\":\"<p>Given an identity (email address or domain), enables or disables whether Amazon SES forwards bounce and complaint notifications as email. Feedback forwarding can only be disabled when Amazon Simple Notification Service (Amazon SNS) topics are specified for both bounces and complaints.</p> <note>Feedback forwarding does not apply to delivery notifications. Delivery notifications are only available through Amazon SNS.</note> <p>This action is throttled at one request per second.</p> <p>For more information about using notifications with Amazon SES, see the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html\\\">Amazon SES Developer Guide</a>.</p>\" \
        }, \
        \"SetIdentityNotificationTopic\":{ \
          \"name\":\"SetIdentityNotificationTopic\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"SetIdentityNotificationTopicRequest\", \
            \"documentation\":\"<p>Represents a request to set or clear an identity's notification topic.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"SetIdentityNotificationTopicResponse\", \
            \"documentation\":\"<p>An empty element. Receiving this element indicates that the request completed successfully.</p>\", \
            \"resultWrapper\":\"SetIdentityNotificationTopicResult\" \
          }, \
          \"documentation\":\"<p>Given an identity (email address or domain), sets the Amazon Simple Notification Service (Amazon SNS) topic to which Amazon SES will publish bounce, complaint, and/or delivery notifications for emails sent with that identity as the <code>Source</code>.</p> <note>Unless feedback forwarding is enabled, you must specify Amazon SNS topics for bounce and complaint notifications. For more information, see <code>SetIdentityFeedbackForwardingEnabled</code>. </note> <p>This action is throttled at one request per second.</p> <p>For more information about feedback notification, see the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html\\\">Amazon SES Developer Guide</a>.</p>\" \
        }, \
        \"VerifyDomainDkim\":{ \
          \"name\":\"VerifyDomainDkim\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"VerifyDomainDkimRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to begin DKIM verification for a domain.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"VerifyDomainDkimResponse\", \
            \"documentation\":\"<p>Represents the DNS records that must be published in the domain name's DNS to complete DKIM setup.</p>\", \
            \"resultWrapper\":\"VerifyDomainDkimResult\" \
          }, \
          \"documentation\":\"<p>Returns a set of DKIM tokens for a domain. DKIM <i>tokens</i> are character strings that represent your domain's identity. Using these tokens, you will need to create DNS CNAME records that point to DKIM public keys hosted by Amazon SES. Amazon Web Services will eventually detect that you have updated your DNS records; this detection process may take up to 72 hours. Upon successful detection, Amazon SES will be able to DKIM-sign email originating from that domain.</p> <p>This action is throttled at one request per second.</p> <p>To enable or disable Easy DKIM signing for a domain, use the <code>SetIdentityDkimEnabled</code> action.</p> <p>For more information about creating DNS records using DKIM tokens, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html\\\">Amazon SES Developer Guide</a>.</p>\" \
        }, \
        \"VerifyDomainIdentity\":{ \
          \"name\":\"VerifyDomainIdentity\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"VerifyDomainIdentityRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to begin domain verification.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"VerifyDomainIdentityResponse\", \
            \"documentation\":\"<p>Represents a token used for domain ownership verification.</p>\", \
            \"resultWrapper\":\"VerifyDomainIdentityResult\" \
          }, \
          \"documentation\":\"<p>Verifies a domain.</p> <p>This action is throttled at one request per second.</p>\" \
        }, \
        \"VerifyEmailAddress\":{ \
          \"name\":\"VerifyEmailAddress\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"VerifyEmailAddressRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to begin email address verification.</p>\" \
          }, \
          \"documentation\":\"<p>Verifies an email address. This action causes a confirmation email message to be sent to the specified address.</p> <important>The VerifyEmailAddress action is deprecated as of the May 15, 2012 release of Domain Verification. The VerifyEmailIdentity action is now preferred.</important> <p>This action is throttled at one request per second.</p>\" \
        }, \
        \"VerifyEmailIdentity\":{ \
          \"name\":\"VerifyEmailIdentity\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"VerifyEmailIdentityRequest\", \
            \"documentation\":\"<p>Represents a request instructing the service to begin email address verification.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"VerifyEmailIdentityResponse\", \
            \"documentation\":\"<p>An empty element. Receiving this element indicates that the request completed successfully.</p>\", \
            \"resultWrapper\":\"VerifyEmailIdentityResult\" \
          }, \
          \"documentation\":\"<p>Verifies an email address. This action causes a confirmation email message to be sent to the specified address.</p> <p>This action is throttled at one request per second.</p>\" \
        } \
      }, \
      \"shapes\":{ \
        \"Address\":{\"type\":\"string\"}, \
        \"AddressList\":{ \
          \"type\":\"list\", \
          \"member\":{\"shape\":\"Address\"} \
        }, \
        \"Body\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Text\":{ \
              \"shape\":\"Content\", \
              \"documentation\":\"<p>The content of the message, in text format. Use this for text-based email clients, or clients on high-latency networks (such as mobile devices). </p>\" \
            }, \
            \"Html\":{ \
              \"shape\":\"Content\", \
              \"documentation\":\"<p>The content of the message, in HTML format. Use this for email clients that can process HTML. You can include clickable links, formatted text, and much more in an HTML message. </p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the body of the message. You can specify text, HTML, or both. If you use both, then the message should display correctly in the widest variety of email clients. </p>\" \
        }, \
        \"Charset\":{\"type\":\"string\"}, \
        \"Content\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Data\"], \
          \"members\":{ \
            \"Data\":{ \
              \"shape\":\"MessageData\", \
              \"documentation\":\"<p>The textual data of the content.</p>\" \
            }, \
            \"Charset\":{ \
              \"shape\":\"Charset\", \
              \"documentation\":\"<p>The character set of the content.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents textual data, plus an optional character set specification.</p> <p>By default, the text must be 7-bit ASCII, due to the constraints of the SMTP protocol. If the text must contain any other characters, then you must also specify a character set. Examples include UTF-8, ISO-8859-1, and Shift_JIS. </p>\" \
        }, \
        \"Counter\":{\"type\":\"long\"}, \
        \"DeleteIdentityRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Identity\"], \
          \"members\":{ \
            \"Identity\":{ \
              \"shape\":\"Identity\", \
              \"documentation\":\"<p>The identity to be removed from the list of identities for the AWS Account.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to delete an identity from the list of identities for the AWS Account.</p>\" \
        }, \
        \"DeleteIdentityResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"documentation\":\"<p>An empty element. Receiving this element indicates that the request completed successfully.</p>\" \
        }, \
        \"DeleteVerifiedEmailAddressRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"EmailAddress\"], \
          \"members\":{ \
            \"EmailAddress\":{ \
              \"shape\":\"Address\", \
              \"documentation\":\"<p>An email address to be removed from the list of verified addresses.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to delete an address from the list of verified email addresses.</p>\" \
        }, \
        \"Destination\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"ToAddresses\":{ \
              \"shape\":\"AddressList\", \
              \"documentation\":\"<p>The To: field(s) of the message.</p>\" \
            }, \
            \"CcAddresses\":{ \
              \"shape\":\"AddressList\", \
              \"documentation\":\"<p>The CC: field(s) of the message.</p>\" \
            }, \
            \"BccAddresses\":{ \
              \"shape\":\"AddressList\", \
              \"documentation\":\"<p>The BCC: field(s) of the message.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the destination of the message, consisting of To:, CC:, and BCC: fields.</p> <p> By default, the string must be 7-bit ASCII. If the text must contain any other characters, then you must use MIME encoded-word syntax (RFC 2047) instead of a literal string. MIME encoded-word syntax uses the following form: <code>=?charset?encoding?encoded-text?=</code>. For more information, see <a href=\\\"http://tools.ietf.org/html/rfc2047\\\">RFC 2047</a>. </p>\" \
        }, \
        \"DkimAttributes\":{ \
          \"type\":\"map\", \
          \"key\":{\"shape\":\"Identity\"}, \
          \"value\":{\"shape\":\"IdentityDkimAttributes\"} \
        }, \
        \"Domain\":{\"type\":\"string\"}, \
        \"Enabled\":{\"type\":\"boolean\"}, \
        \"GetIdentityDkimAttributesRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Identities\"], \
          \"members\":{ \
            \"Identities\":{ \
              \"shape\":\"IdentityList\", \
              \"documentation\":\"<p>A list of one or more verified identities - email addresses, domains, or both.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Given a list of verified identities, describes their DKIM attributes. The DKIM attributes of an email address identity includes whether DKIM signing is individually enabled or disabled for that address. The DKIM attributes of a domain name identity includes whether DKIM signing is enabled, as well as the DNS records (tokens) that must remain published in the domain name's DNS.</p>\" \
        }, \
        \"GetIdentityDkimAttributesResponse\":{ \
          \"type\":\"structure\", \
          \"required\":[\"DkimAttributes\"], \
          \"members\":{ \
            \"DkimAttributes\":{ \
              \"shape\":\"DkimAttributes\", \
              \"documentation\":\"<p>The DKIM attributes for an email address or a domain. </p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a list of all the DKIM attributes for the specified identity.</p>\" \
        }, \
        \"GetIdentityNotificationAttributesRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Identities\"], \
          \"members\":{ \
            \"Identities\":{ \
              \"shape\":\"IdentityList\", \
              \"documentation\":\"<p>A list of one or more identities.</p>\" \
            } \
          } \
        }, \
        \"GetIdentityNotificationAttributesResponse\":{ \
          \"type\":\"structure\", \
          \"required\":[\"NotificationAttributes\"], \
          \"members\":{ \
            \"NotificationAttributes\":{ \
              \"shape\":\"NotificationAttributes\", \
              \"documentation\":\"<p>A map of Identity to IdentityNotificationAttributes.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Describes whether an identity has Amazon Simple Notification Service (Amazon SNS) topics set for bounce, complaint, and/or delivery notifications, and specifies whether feedback forwarding is enabled for bounce and complaint notifications.</p>\" \
        }, \
        \"GetIdentityVerificationAttributesRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Identities\"], \
          \"members\":{ \
            \"Identities\":{ \
              \"shape\":\"IdentityList\", \
              \"documentation\":\"<p>A list of identities.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to provide the verification attributes for a list of identities.</p>\" \
        }, \
        \"GetIdentityVerificationAttributesResponse\":{ \
          \"type\":\"structure\", \
          \"required\":[\"VerificationAttributes\"], \
          \"members\":{ \
            \"VerificationAttributes\":{ \
              \"shape\":\"VerificationAttributes\", \
              \"documentation\":\"<p>A map of Identities to IdentityVerificationAttributes objects.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the verification attributes for a list of identities.</p>\" \
        }, \
        \"GetSendQuotaResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Max24HourSend\":{ \
              \"shape\":\"Max24HourSend\", \
              \"documentation\":\"<p>The maximum number of emails the user is allowed to send in a 24-hour interval.</p>\" \
            }, \
            \"MaxSendRate\":{ \
              \"shape\":\"MaxSendRate\", \
              \"documentation\":\"<p>The maximum number of emails the user is allowed to send per second.</p>\" \
            }, \
            \"SentLast24Hours\":{ \
              \"shape\":\"SentLast24Hours\", \
              \"documentation\":\"<p>The number of emails sent during the previous 24 hours.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the user's current activity limits returned from a successful <code>GetSendQuota</code> request. </p>\" \
        }, \
        \"GetSendStatisticsResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"SendDataPoints\":{ \
              \"shape\":\"SendDataPointList\", \
              \"documentation\":\"<p>A list of data points, each of which represents 15 minutes of activity.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a list of <code>SendDataPoint</code> items returned from a successful <code>GetSendStatistics</code> request. This list contains aggregated data from the previous two weeks of sending activity. </p>\" \
        }, \
        \"Identity\":{\"type\":\"string\"}, \
        \"IdentityDkimAttributes\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"DkimEnabled\", \
            \"DkimVerificationStatus\" \
          ], \
          \"members\":{ \
            \"DkimEnabled\":{ \
              \"shape\":\"Enabled\", \
              \"documentation\":\"<p>True if DKIM signing is enabled for email sent from the identity; false otherwise.</p>\" \
            }, \
            \"DkimVerificationStatus\":{ \
              \"shape\":\"VerificationStatus\", \
              \"documentation\":\"<p>Describes whether Amazon SES has successfully verified the DKIM DNS records (tokens) published in the domain name's DNS. (This only applies to domain identities, not email address identities.)</p>\" \
            }, \
            \"DkimTokens\":{ \
              \"shape\":\"VerificationTokenList\", \
              \"documentation\":\"<p>A set of character strings that represent the domain's identity. Using these tokens, you will need to create DNS CNAME records that point to DKIM public keys hosted by Amazon SES. Amazon Web Services will eventually detect that you have updated your DNS records; this detection process may take up to 72 hours. Upon successful detection, Amazon SES will be able to DKIM-sign email originating from that domain. (This only applies to domain identities, not email address identities.)</p> <p>For more information about creating DNS records using DKIM tokens, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html\\\">Amazon SES Developer Guide</a>.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the DKIM attributes of a verified email address or a domain.</p>\" \
        }, \
        \"IdentityList\":{ \
          \"type\":\"list\", \
          \"member\":{\"shape\":\"Identity\"} \
        }, \
        \"IdentityNotificationAttributes\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"BounceTopic\", \
            \"ComplaintTopic\", \
            \"DeliveryTopic\", \
            \"ForwardingEnabled\" \
          ], \
          \"members\":{ \
            \"BounceTopic\":{ \
              \"shape\":\"NotificationTopic\", \
              \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will publish bounce notifications.</p>\" \
            }, \
            \"ComplaintTopic\":{ \
              \"shape\":\"NotificationTopic\", \
              \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will publish complaint notifications.</p>\" \
            }, \
            \"DeliveryTopic\":{ \
              \"shape\":\"NotificationTopic\", \
              \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will publish delivery notifications.</p>\" \
            }, \
            \"ForwardingEnabled\":{ \
              \"shape\":\"Enabled\", \
              \"documentation\":\"<p>Describes whether Amazon SES will forward bounce and complaint notifications as email. <code>true</code> indicates that Amazon SES will forward bounce and complaint notifications as email, while <code>false</code> indicates that bounce and complaint notifications will be published only to the specified bounce and complaint Amazon SNS topics.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the notification attributes of an identity, including whether an identity has Amazon Simple Notification Service (Amazon SNS) topics set for bounce, complaint, and/or delivery notifications, and whether feedback forwarding is enabled for bounce and complaint notifications.</p>\" \
        }, \
        \"IdentityType\":{ \
          \"type\":\"string\", \
          \"enum\":[ \
            \"EmailAddress\", \
            \"Domain\" \
          ] \
        }, \
        \"IdentityVerificationAttributes\":{ \
          \"type\":\"structure\", \
          \"required\":[\"VerificationStatus\"], \
          \"members\":{ \
            \"VerificationStatus\":{ \
              \"shape\":\"VerificationStatus\", \
              \"documentation\":\"<p>The verification status of the identity: \\\"Pending\\\", \\\"Success\\\", \\\"Failed\\\", or \\\"TemporaryFailure\\\".</p>\" \
            }, \
            \"VerificationToken\":{ \
              \"shape\":\"VerificationToken\", \
              \"documentation\":\"<p>The verification token for a domain identity. Null for email address identities.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the verification attributes of a single identity.</p>\" \
        }, \
        \"ListIdentitiesRequest\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"IdentityType\":{ \
              \"shape\":\"IdentityType\", \
              \"documentation\":\"<p>The type of the identities to list. Possible values are \\\"EmailAddress\\\" and \\\"Domain\\\". If this parameter is omitted, then all identities will be listed.</p>\" \
            }, \
            \"NextToken\":{ \
              \"shape\":\"NextToken\", \
              \"documentation\":\"<p>The token to use for pagination.</p>\" \
            }, \
            \"MaxItems\":{ \
              \"shape\":\"MaxItems\", \
              \"documentation\":\"<p>The maximum number of identities per page. Possible values are 1-100 inclusive.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to list all identities for the AWS Account.</p>\" \
        }, \
        \"ListIdentitiesResponse\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Identities\"], \
          \"members\":{ \
            \"Identities\":{ \
              \"shape\":\"IdentityList\", \
              \"documentation\":\"<p>A list of identities.</p>\" \
            }, \
            \"NextToken\":{ \
              \"shape\":\"NextToken\", \
              \"documentation\":\"<p>The token used for pagination.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a list of all verified identities for the AWS Account.</p>\" \
        }, \
        \"ListVerifiedEmailAddressesResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"VerifiedEmailAddresses\":{ \
              \"shape\":\"AddressList\", \
              \"documentation\":\"<p>A list of email addresses that have been verified.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a list of all the email addresses verified for the current user.</p>\" \
        }, \
        \"Max24HourSend\":{\"type\":\"double\"}, \
        \"MaxItems\":{\"type\":\"integer\"}, \
        \"MaxSendRate\":{\"type\":\"double\"}, \
        \"Message\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Subject\", \
            \"Body\" \
          ], \
          \"members\":{ \
            \"Subject\":{ \
              \"shape\":\"Content\", \
              \"documentation\":\"<p>The subject of the message: A short summary of the content, which will appear in the recipient's inbox.</p>\" \
            }, \
            \"Body\":{ \
              \"shape\":\"Body\", \
              \"documentation\":\"<p>The message body.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the message to be sent, composed of a subject and a body.</p>\" \
        }, \
        \"MessageData\":{\"type\":\"string\"}, \
        \"MessageId\":{\"type\":\"string\"}, \
        \"MessageRejected\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"MessageRejected\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"Indicates that the action failed, and the message could not be sent. Check the error stack for more information about what caused the error.\" \
        }, \
        \"NextToken\":{\"type\":\"string\"}, \
        \"NotificationAttributes\":{ \
          \"type\":\"map\", \
          \"key\":{\"shape\":\"Identity\"}, \
          \"value\":{\"shape\":\"IdentityNotificationAttributes\"} \
        }, \
        \"NotificationTopic\":{\"type\":\"string\"}, \
        \"NotificationType\":{ \
          \"type\":\"string\", \
          \"enum\":[ \
            \"Bounce\", \
            \"Complaint\", \
            \"Delivery\" \
          ] \
        }, \
        \"RawMessage\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Data\"], \
          \"members\":{ \
            \"Data\":{ \
              \"shape\":\"RawMessageData\", \
              \"documentation\":\"<p>The raw data of the message. The client must ensure that the message format complies with Internet email standards regarding email header fields, MIME types, MIME encoding, and base64 encoding (if necessary). </p> <p>The To:, CC:, and BCC: headers in the raw message can contain a group list. </p> <p>For more information, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html\\\">Amazon SES Developer Guide</a>. </p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the raw data of the message.</p>\" \
        }, \
        \"RawMessageData\":{\"type\":\"blob\"}, \
        \"SendDataPoint\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Timestamp\":{ \
              \"shape\":\"Timestamp\", \
              \"documentation\":\"<p>Time of the data point.</p>\" \
            }, \
            \"DeliveryAttempts\":{ \
              \"shape\":\"Counter\", \
              \"documentation\":\"<p>Number of emails that have been enqueued for sending.</p>\" \
            }, \
            \"Bounces\":{ \
              \"shape\":\"Counter\", \
              \"documentation\":\"<p>Number of emails that have bounced.</p>\" \
            }, \
            \"Complaints\":{ \
              \"shape\":\"Counter\", \
              \"documentation\":\"<p>Number of unwanted emails that were rejected by recipients.</p>\" \
            }, \
            \"Rejects\":{ \
              \"shape\":\"Counter\", \
              \"documentation\":\"<p>Number of emails rejected by Amazon SES.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents sending statistics data. Each <code>SendDataPoint</code> contains statistics for a 15-minute period of sending activity. </p>\" \
        }, \
        \"SendDataPointList\":{ \
          \"type\":\"list\", \
          \"member\":{\"shape\":\"SendDataPoint\"} \
        }, \
        \"SendEmailRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Source\", \
            \"Destination\", \
            \"Message\" \
          ], \
          \"members\":{ \
            \"Source\":{ \
              \"shape\":\"Address\", \
              \"documentation\":\"<p>The identity's email address.</p> <p> By default, the string must be 7-bit ASCII. If the text must contain any other characters, then you must use MIME encoded-word syntax (RFC 2047) instead of a literal string. MIME encoded-word syntax uses the following form: <code>=?charset?encoding?encoded-text?=</code>. For more information, see <a href=\\\"http://tools.ietf.org/html/rfc2047\\\">RFC 2047</a>. </p>\" \
            }, \
            \"Destination\":{ \
              \"shape\":\"Destination\", \
              \"documentation\":\"<p>The destination for this email, composed of To:, CC:, and BCC: fields.</p>\" \
            }, \
            \"Message\":{ \
              \"shape\":\"Message\", \
              \"documentation\":\"<p>The message to be sent.</p>\" \
            }, \
            \"ReplyToAddresses\":{ \
              \"shape\":\"AddressList\", \
              \"documentation\":\"<p>The reply-to email address(es) for the message. If the recipient replies to the message, each reply-to address will receive the reply. </p>\" \
            }, \
            \"ReturnPath\":{ \
              \"shape\":\"Address\", \
              \"documentation\":\"<p>The email address to which bounces and complaints are to be forwarded when feedback forwarding is enabled. If the message cannot be delivered to the recipient, then an error message will be returned from the recipient's ISP; this message will then be forwarded to the email address specified by the <code>ReturnPath</code> parameter. </p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to send a single email message.</p> <p>This datatype can be used in application code to compose a message consisting of source, destination, message, reply-to, and return-path parts. This object can then be sent using the <code>SendEmail</code> action. </p>\" \
        }, \
        \"SendEmailResponse\":{ \
          \"type\":\"structure\", \
          \"required\":[\"MessageId\"], \
          \"members\":{ \
            \"MessageId\":{ \
              \"shape\":\"MessageId\", \
              \"documentation\":\"<p>The unique message identifier returned from the <code>SendEmail</code> action. </p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a unique message ID returned from a successful <code>SendEmail</code> request. </p>\" \
        }, \
        \"SendRawEmailRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"RawMessage\"], \
          \"members\":{ \
            \"Source\":{ \
              \"shape\":\"Address\", \
              \"documentation\":\"<p>The identity's email address.</p> <p> By default, the string must be 7-bit ASCII. If the text must contain any other characters, then you must use MIME encoded-word syntax (RFC 2047) instead of a literal string. MIME encoded-word syntax uses the following form: <code>=?charset?encoding?encoded-text?=</code>. For more information, see <a href=\\\"http://tools.ietf.org/html/rfc2047\\\">RFC 2047</a>. </p> <note>If you specify the <code>Source</code> parameter and have feedback forwarding enabled, then bounces and complaints will be sent to this email address. This takes precedence over any <i>Return-Path</i> header that you might include in the raw text of the message. </note>\" \
            }, \
            \"Destinations\":{ \
              \"shape\":\"AddressList\", \
              \"documentation\":\"<p>A list of destinations for the message, consisting of To:, CC:, and BCC: addresses.</p>\" \
            }, \
            \"RawMessage\":{ \
              \"shape\":\"RawMessage\", \
              \"documentation\":\"<p>The raw text of the message. The client is responsible for ensuring the following:</p> <p> <ul> <li>Message must contain a header and a body, separated by a blank line.</li> <li>All required header fields must be present.</li> <li>Each part of a multipart MIME message must be formatted properly.</li> <li>MIME content types must be among those supported by Amazon SES. For more information, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/mime-types.html\\\">Amazon SES Developer Guide</a>. </li> <li>Content must be base64-encoded, if MIME requires it.</li> </ul> </p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to send a raw email message.</p> <p>This datatype can be used in application code to compose a message consisting of source, destination, and raw message text. This object can then be sent using the <code>SendRawEmail</code> action. </p>\" \
        }, \
        \"SendRawEmailResponse\":{ \
          \"type\":\"structure\", \
          \"required\":[\"MessageId\"], \
          \"members\":{ \
            \"MessageId\":{ \
              \"shape\":\"MessageId\", \
              \"documentation\":\"<p>The unique message identifier returned from the <code>SendRawEmail</code> action. </p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a unique message ID returned from a successful <code>SendRawEmail</code> request. </p>\" \
        }, \
        \"SentLast24Hours\":{\"type\":\"double\"}, \
        \"SetIdentityDkimEnabledRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Identity\", \
            \"DkimEnabled\" \
          ], \
          \"members\":{ \
            \"Identity\":{ \
              \"shape\":\"Identity\", \
              \"documentation\":\"<p>The identity for which DKIM signing should be enabled or disabled.</p>\" \
            }, \
            \"DkimEnabled\":{ \
              \"shape\":\"Enabled\", \
              \"documentation\":\"<p>Sets whether DKIM signing is enabled for an identity. Set to <code>true</code> to enable DKIM signing for this identity; <code>false</code> to disable it. </p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to enable or disable DKIM signing for an identity.</p>\" \
        }, \
        \"SetIdentityDkimEnabledResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"documentation\":\"<p>An empty element. Receiving this element indicates that the request completed successfully.</p>\" \
        }, \
        \"SetIdentityFeedbackForwardingEnabledRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Identity\", \
            \"ForwardingEnabled\" \
          ], \
          \"members\":{ \
            \"Identity\":{ \
              \"shape\":\"Identity\", \
              \"documentation\":\"<p>The identity for which to set bounce and complaint notification forwarding. Examples: <code>user@example.com</code>, <code>example.com</code>.</p>\" \
            }, \
            \"ForwardingEnabled\":{ \
              \"shape\":\"Enabled\", \
              \"documentation\":\"<p>Sets whether Amazon SES will forward bounce and complaint notifications as email. <code>true</code> specifies that Amazon SES will forward bounce and complaint notifications as email, in addition to any Amazon SNS topic publishing otherwise specified. <code>false</code> specifies that Amazon SES will publish bounce and complaint notifications only through Amazon SNS. This value can only be set to <code>false</code> when Amazon SNS topics are set for both <code>Bounce</code> and <code>Complaint</code> notification types.</p>\" \
            } \
          } \
        }, \
        \"SetIdentityFeedbackForwardingEnabledResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"documentation\":\"<p>An empty element. Receiving this element indicates that the request completed successfully.</p>\" \
        }, \
        \"SetIdentityNotificationTopicRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Identity\", \
            \"NotificationType\" \
          ], \
          \"members\":{ \
            \"Identity\":{ \
              \"shape\":\"Identity\", \
              \"documentation\":\"<p>The identity for which the Amazon SNS topic will be set. Examples: <code>user@example.com</code>, <code>example.com</code>.</p>\" \
            }, \
            \"NotificationType\":{ \
              \"shape\":\"NotificationType\", \
              \"documentation\":\"<p>The type of notifications that will be published to the specified Amazon SNS topic.</p>\" \
            }, \
            \"SnsTopic\":{ \
              \"shape\":\"NotificationTopic\", \
              \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic. If the parameter is omitted from the request or a null value is passed, <code>SnsTopic</code> is cleared and publishing is disabled.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request to set or clear an identity's notification topic.</p>\" \
        }, \
        \"SetIdentityNotificationTopicResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"documentation\":\"<p>An empty element. Receiving this element indicates that the request completed successfully.</p>\" \
        }, \
        \"Timestamp\":{\"type\":\"timestamp\"}, \
        \"VerificationAttributes\":{ \
          \"type\":\"map\", \
          \"key\":{\"shape\":\"Identity\"}, \
          \"value\":{\"shape\":\"IdentityVerificationAttributes\"} \
        }, \
        \"VerificationStatus\":{ \
          \"type\":\"string\", \
          \"enum\":[ \
            \"Pending\", \
            \"Success\", \
            \"Failed\", \
            \"TemporaryFailure\", \
            \"NotStarted\" \
          ] \
        }, \
        \"VerificationToken\":{\"type\":\"string\"}, \
        \"VerificationTokenList\":{ \
          \"type\":\"list\", \
          \"member\":{\"shape\":\"VerificationToken\"} \
        }, \
        \"VerifyDomainDkimRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Domain\"], \
          \"members\":{ \
            \"Domain\":{ \
              \"shape\":\"Domain\", \
              \"documentation\":\"<p>The name of the domain to be verified for Easy DKIM signing.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to begin DKIM verification for a domain.</p>\" \
        }, \
        \"VerifyDomainDkimResponse\":{ \
          \"type\":\"structure\", \
          \"required\":[\"DkimTokens\"], \
          \"members\":{ \
            \"DkimTokens\":{ \
              \"shape\":\"VerificationTokenList\", \
              \"documentation\":\"<p>A set of character strings that represent the domain's identity. If the identity is an email address, the tokens represent the domain of that address.</p> <p>Using these tokens, you will need to create DNS CNAME records that point to DKIM public keys hosted by Amazon SES. Amazon Web Services will eventually detect that you have updated your DNS records; this detection process may take up to 72 hours. Upon successful detection, Amazon SES will be able to DKIM-sign emails originating from that domain.</p> <p>For more information about creating DNS records using DKIM tokens, go to the <a href=\\\"http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html\\\">Amazon SES Developer Guide</a>.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the DNS records that must be published in the domain name's DNS to complete DKIM setup.</p>\" \
        }, \
        \"VerifyDomainIdentityRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Domain\"], \
          \"members\":{ \
            \"Domain\":{ \
              \"shape\":\"Domain\", \
              \"documentation\":\"<p>The domain to be verified.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to begin domain verification.</p>\" \
        }, \
        \"VerifyDomainIdentityResponse\":{ \
          \"type\":\"structure\", \
          \"required\":[\"VerificationToken\"], \
          \"members\":{ \
            \"VerificationToken\":{ \
              \"shape\":\"VerificationToken\", \
              \"documentation\":\"<p>A TXT record that must be placed in the DNS settings for the domain, in order to complete domain verification.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a token used for domain ownership verification.</p>\" \
        }, \
        \"VerifyEmailAddressRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"EmailAddress\"], \
          \"members\":{ \
            \"EmailAddress\":{ \
              \"shape\":\"Address\", \
              \"documentation\":\"<p>The email address to be verified.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to begin email address verification.</p>\" \
        }, \
        \"VerifyEmailIdentityRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"EmailAddress\"], \
          \"members\":{ \
            \"EmailAddress\":{ \
              \"shape\":\"Address\", \
              \"documentation\":\"<p>The email address to be verified.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents a request instructing the service to begin email address verification.</p>\" \
        }, \
        \"VerifyEmailIdentityResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"documentation\":\"<p>An empty element. Receiving this element indicates that the request completed successfully.</p>\" \
        } \
      } \
    } \
     \
    ";
}

@end
