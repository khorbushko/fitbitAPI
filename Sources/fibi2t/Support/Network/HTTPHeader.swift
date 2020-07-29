//
//  HTTPHeader.swift
//  fibi
//
//  Created by Kyryl Horbushko on 29.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

/// Permanent Message Header Field Names
///
/// Expert Review
///
/// Expert(s)
/// Graham Klyne
///
/// Reference
/// [RFC3864](https://www.iana.org/go/rfc3864)
///
/// ### Note
/// [RFC5504](https://www.iana.org/go/rfc5504) specified that no new header fields be registered that begin with "Downgraded-".
///
/// That restriction is now lifted, per [RFC6857](https://www.iana.org/go/rfc6857).
///
/// ### Note
/// See section 8.3.1 of [RFC7231](https://www.iana.org/go/rfc7231) for information on registering new HTTP Header Fields.
///
///
/// [Source](http://www.iana.org/assignments/message-headers/message-headers.xhtml)
enum HTTPHeader {

  enum Key {

    /// Area: http; status -  ref - [RFC4229]
    public static let aIm = "A-IM"
    /// Area: http; status - standard ref - [RFC7231, Section 5.3.2]
    public static let accept = "Accept"
    /// Area: http; status - experimental ref - [RFC4229]
    public static let acceptAdditions = "Accept-Additions"
    /// Area: http; status - experimental ref - [RFC7231, Section 5.3.3]
    public static let acceptCharset = "Accept-Charset"
    /// Area: http; status - experimental ref - [RFC7089]
    public static let acceptDatetime = "Accept-Datetime"
    /// Area: http; status - standard ref - [RFC7231, Section 5.3.4][RFC7694, Section 3]
    public static let acceptEncoding = "Accept-Encoding"
    /// Area: http; status - standard ref - [RFC4229]
    public static let acceptFeatures = "Accept-Features"
    /// Area: http; status - standard ref - [RFC7231, Section 5.3.5]
    /// Area: mail; status - obsoleted ref - [RFC4021]
    public static let acceptLanguage = "Accept-Language"
    /// Area: http; status - obsoleted ref - [RFC5789]
    public static let acceptPatch = "Accept-Patch"
    /// Area: http; status - experimental ref - [https://www.w3.org/TR/ldp/]
    public static let acceptPost = "Accept-Post"
    /// Area: http; status - standard ref - [RFC7233, Section 2.3]
    public static let acceptRanges = "Accept-Ranges"
    /// Area: http; status - standard ref - [RFC7234, Section 5.1]
    public static let age = "Age"
    /// Area: http; status - standard ref - [RFC7231, Section 7.4.1]
    public static let allow = "Allow"
    /// Area: http; status - standard ref - [RFC7639, Section 2]
    public static let alpn = "ALPN"
    /// Area: netnews; status -  ref - [RFC1849][RFC5536]
    public static let alsoControl = "Also-Control"
    /// Area: http; status -  ref - [RFC7838]
    public static let altSvc = "Alt-Svc"
    /// Area: http; status - obsoleted ref - [RFC7838]
    public static let altUsed = "Alt-Used"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let alternateRecipient = "Alternate-Recipient"
    /// Area: http; status - reserved ref - [RFC4229]
    public static let alternates = "Alternates"
    /// Area: http; status -  ref - [RFC4437]
    public static let applyToRedirectRef = "Apply-To-Redirect-Ref"
    /// Area: netnews; status -  ref - [RFC5536]
    public static let approved = "Approved"
    /// Area: mail; status -  ref - [RFC8617]
    public static let arcAuthenticationResults = "ARC-Authentication-Results"
    /// Area: mail; status -  ref - [RFC8617]
    public static let arcMessageSignature = "ARC-Message-Signature"
    /// Area: mail; status -  ref - [RFC8617]
    public static let arcSeal = "ARC-Seal"
    /// Area: netnews; status - standard ref - [RFC5536]
    public static let archive = "Archive"
    /// Area: mail; status - standard ref - [RFC5064]
    /// Area: netnews; status - standard ref - [RFC5064]
    public static let archivedAt = "Archived-At"
    /// Area: netnews; status - standard ref - [RFC1849][RFC5536]
    public static let articleNames = "Article-Names"
    /// Area: netnews; status - standard ref - [RFC1849][RFC5536]
    public static let articleUpdates = "Article-Updates"
    /// Area: http; status - standard ref - [RFC8053, Section 4]
    public static let authenticationControl = "Authentication-Control"
    /// Area: http; status - standard ref - [RFC7615, Section 3]
    public static let authenticationInfo = "Authentication-Info"
    /// Area: mail; status - standard ref - [RFC8601]
    public static let authenticationResults = "Authentication-Results"
    /// Area: http; status - standard ref - [RFC7235, Section 4.2]
    public static let authorization = "Authorization"
    /// Area: mail; status - reserved ref - [RFC3834 section 5]
    public static let autoSubmitted = "Auto-Submitted"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let autoforwarded = "Autoforwarded"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let autosubmitted = "Autosubmitted"
    /// Area: MIME; status - standard ref - [RFC1808][RFC2068 Section 14.11]
    public static let base = "Base"
    /// Area: mail; status -  ref - [RFC5322]
    public static let bcc = "Bcc"
    /// Area: none; status - obsoleted ref - [RFC6068]
    public static let body = "Body"
    /// Area: http; status - obsoleted ref - [RFC4229]
    public static let cExt = "C-Ext"
    /// Area: http; status -  ref - [RFC4229]
    public static let cMan = "C-Man"
    /// Area: http; status - standard ref - [RFC4229]
    public static let cOpt = "C-Opt"
    /// Area: http; status -  ref - [RFC4229]
    public static let cPep = "C-PEP"
    /// Area: http; status -  ref - [RFC4229]
    public static let cPepInfo = "C-PEP-Info"
    /// Area: http; status - standard ref - [RFC7234, Section 5.2]
    public static let cacheControl = "Cache-Control"
    /// Area: http; status -  ref - [RFC8607, Section 5.1]
    public static let calManagedId = "Cal-Managed-ID"
    /// Area: http; status -  ref - [RFC7809, Section 7.1]
    public static let caldavTimezones = "CalDAV-Timezones"
    /// Area: netnews; status -  ref - [RFC8315]
    public static let cancelKey = "Cancel-Key"
    /// Area: netnews; status -  ref - [RFC8315]
    public static let cancelLock = "Cancel-Lock"
    /// Area: mail; status - standard ref - [RFC5322]
    public static let cc = "Cc"
    /// Area: http; status -  ref - [RFC8586]
    public static let cdnLoop = "CDN-Loop"
    /// Area: http; status - standard ref - [RFC-ietf-acme-star-09, Section 3.3]
    public static let certNotAfter = "Cert-Not-After"
    /// Area: http; status - standard ref - [RFC-ietf-acme-star-09, Section 3.3]
    public static let certNotBefore = "Cert-Not-Before"
    /// Area: http; status -  ref - [RFC7230, Section 8.1]
    public static let close = "Close"
    /// Area: mail; status -  ref - [RFC5322]
    /// Area: netnews; status -  ref - [RFC5536][RFC5322]
    public static let comments = "Comments"
    /// Area: http; status - standard ref - [RFC7230, Section 6.1]
    public static let connection = "Connection"
    /// Area: MIME; status -  ref - [RFC4021]
    public static let contentAlternative = "Content-Alternative"
    /// Area: http; status -  ref - [RFC2068][RFC2616]
    /// Area: MIME; status -  ref - [RFC2110][RFC2557]
    public static let contentBase = "Content-Base"
    /// Area: MIME; status -  ref - [RFC4021]
    public static let contentDescription = "Content-Description"
    /// Area: http; status - standard ref - [RFC6266]
    /// Area: MIME; status - standard ref - [RFC4021]
    public static let contentDisposition = "Content-Disposition"
    /// Area: MIME; status -  ref - [RFC4021]
    public static let contentDuration = "Content-Duration"
    /// Area: http; status -  ref - [RFC7231, Section 3.1.2.2]
    public static let contentEncoding = "Content-Encoding"
    /// Area: MIME; status - standard ref - [RFC4021]
    public static let contentFeatures = "Content-features"
    /// Area: http; status -  ref - [RFC4229]
    /// Area: MIME; status -  ref - [RFC4021]
    public static let contentId = "Content-ID"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let contentIdentifier = "Content-Identifier"
    /// Area: http; status - obsoleted ref - [RFC7231, Section 3.1.3.2]
    /// Area: MIME; status - standard ref - [RFC4021]
    public static let contentLanguage = "Content-Language"
    /// Area: http; status - standard ref - [RFC7230, Section 3.3.2]
    public static let contentLength = "Content-Length"
    /// Area: http; status -  ref - [RFC7231, Section 3.1.4.2]
    /// Area: MIME; status - standard ref - [RFC4021]
    public static let contentLocation = "Content-Location"
    /// Area: http; status - standard ref - [RFC4229]
    /// Area: MIME; status - standard ref - [RFC4021]
    public static let contentMd5 = "Content-MD5"
    /// Area: http; status - obsoleted ref - [RFC7233, Section 4.2]
    public static let contentRange = "Content-Range"
    /// Area: mail; status -  ref - [RFC4021]
    public static let contentReturn = "Content-Return"
    /// Area: http; status -  ref - [RFC4229]
    public static let contentScriptType = "Content-Script-Type"
    /// Area: http; status -  ref - [RFC4229]
    public static let contentStyleType = "Content-Style-Type"
    /// Area: MIME; status -  ref - [RFC4021]
    public static let contentTransferEncoding = "Content-Transfer-Encoding"
    /// Area: MIME; status - standard ref - [RFC8255]
    public static let contentTranslationType = "Content-Translation-Type"
    /// Area: http; status -  ref - [RFC7231, Section 3.1.1.5]
    /// Area: MIME; status - standard ref - [RFC4021]
    public static let contentType = "Content-Type"
    /// Area: http; status -  ref - [RFC4229]
    public static let contentVersion = "Content-Version"
    /// Area: netnews; status -  ref - [RFC5536]
    public static let control = "Control"
    /// Area: mail; status -  ref - [RFC4021]
    public static let conversion = "Conversion"
    /// Area: mail; status -  ref - [RFC4021]
    public static let conversionWithLoss = "Conversion-With-Loss"
    /// Area: http; status -  ref - [RFC6265]
    public static let cookie = "Cookie"
    /// Area: http; status -  ref - [RFC2965][RFC6265]
    public static let cookie2 = "Cookie2"
    /// Area: http; status -  ref - [RFC5323]
    public static let dasl = "DASL"
    /// Area: http; status - standard ref - [RFC4918]
    public static let dav = "DAV"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let dlExpansionHistory = "DL-Expansion-History"
    /// Area: http; status - obsoleted ref - [RFC7231, Section 7.1.1.2]
    /// Area: mail; status - obsoleted ref - [RFC5322]
    /// Area: netnews; status - obsoleted ref - [RFC5536][RFC5322]
    public static let date = "Date"
    /// Area: netnews; status - standard ref - [RFC0850][RFC5536]
    public static let dateReceived = "Date-Received"
    /// Area: http; status - obsoleted ref - [RFC4229]
    public static let defaultStyle = "Default-Style"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let deferredDelivery = "Deferred-Delivery"
    /// Area: mail; status - obsoleted ref - [RFC4021]
    public static let deliveryDate = "Delivery-Date"
    /// Area: http; status - standard ref - [RFC4229]
    public static let deltaBase = "Delta-Base"
    /// Area: http; status - standard ref - [RFC4918]
    public static let depth = "Depth"
    /// Area: http; status - obsoleted ref - [RFC4229]
    public static let derivedFrom = "Derived-From"
    /// Area: http; status - standard ref - [RFC4918]
    public static let destination = "Destination"
    /// Area: http; status - obsoleted ref - [RFC4229]
    public static let differentialId = "Differential-ID"
    /// Area: http; status - obsoleted ref - [RFC4229]
    public static let digest = "Digest"
    /// Area: mail; status - obsoleted ref - [RFC4021]
    public static let discardedX400IpmsExtensions = "Discarded-X400-IPMS-Extensions"
    /// Area: mail; status - obsoleted ref - [RFC4021]
    public static let discardedX400MtsExtensions = "Discarded-X400-MTS-Extensions"
    /// Area: mail; status - obsoleted ref - [RFC4021]
    public static let discloseRecipients = "Disclose-Recipients"
    /// Area: mail; status - obsoleted ref - [RFC4021]
    public static let dispositionNotificationOptions = "Disposition-Notification-Options"
    /// Area: mail; status - obsoleted ref - [RFC4021]
    public static let dispositionNotificationTo = "Disposition-Notification-To"
    /// Area: netnews; status - obsoleted ref - [RFC5536]
    public static let distribution = "Distribution"
    /// Area: mail; status - obsoleted ref - [RFC6376]
    public static let dkimSignature = "DKIM-Signature"
    /// Area: mail; status - obsoleted ref - [RFC5504][RFC6857]
    public static let downgradedBcc = "Downgraded-Bcc"
    /// Area: mail; status - standard ref - [RFC5504][RFC6857]
    public static let downgradedCc = "Downgraded-Cc"
    /// Area: mail; status -  ref - [RFC5504][RFC6857]
    public static let downgradedDispositionNotificationTo = "Downgraded-Disposition-Notification-To"
    /// Area: mail; status -  ref - [RFC6857 Section 3.1.10]
    public static let downgradedFinalRecipient = "Downgraded-Final-Recipient"
    /// Area: mail; status - standard ref - [RFC5504][RFC6857 Section 3.1.10]
    public static let downgradedFrom = "Downgraded-From"
    /// Area: mail; status - standard ref - [RFC6857 Section 3.1.10]
    public static let downgradedInReplyTo = "Downgraded-In-Reply-To"
    /// Area: mail; status - experimental ref - [RFC5504][RFC6857 Section 3.1.10]
    public static let downgradedMailFrom = "Downgraded-Mail-From"
    /// Area: mail; status - standard ref - [RFC6857 Section 3.1.10]
    public static let downgradedMessageId = "Downgraded-Message-Id"
    /// Area: mail; status -  ref - [RFC6857 Section 3.1.10]
    public static let downgradedOriginalRecipient = "Downgraded-Original-Recipient"
    /// Area: mail; status - standard ref - [RFC5504][RFC6857]
    public static let downgradedRcptTo = "Downgraded-Rcpt-To"
    /// Area: mail; status -  ref - [RFC6857 Section 3.1.10]
    public static let downgradedReferences = "Downgraded-References"
    /// Area: mail; status -  ref - [RFC5504][RFC6857]
    public static let downgradedReplyTo = "Downgraded-Reply-To"
    /// Area: mail; status - standard ref - [RFC5504][RFC6857]
    public static let downgradedResentBcc = "Downgraded-Resent-Bcc"
    /// Area: mail; status - standard ref - [RFC5504][RFC6857]
    public static let downgradedResentCc = "Downgraded-Resent-Cc"
    /// Area: mail; status - standard ref - [RFC5504][RFC6857]
    public static let downgradedResentFrom = "Downgraded-Resent-From"
    /// Area: mail; status - standard ref - [RFC5504][RFC6857]
    public static let downgradedResentReplyTo = "Downgraded-Resent-Reply-To"
    /// Area: mail; status - standard ref - [RFC5504][RFC6857]
    public static let downgradedResentSender = "Downgraded-Resent-Sender"
    /// Area: mail; status -  ref - [RFC5504][RFC6857]
    public static let downgradedResentTo = "Downgraded-Resent-To"
    /// Area: mail; status -  ref - [RFC5504][RFC6857]
    public static let downgradedReturnPath = "Downgraded-Return-Path"
    /// Area: mail; status - experimental ref - [RFC5504][RFC6857]
    public static let downgradedSender = "Downgraded-Sender"
    /// Area: mail; status - standard ref - [RFC5504][RFC6857]
    public static let downgradedTo = "Downgraded-To"
    /// Area: http; status - standard ref - [RFC8470]
    public static let earlyData = "Early-Data"
    /// Area: mail; status -  ref - [RFC4021]
    public static let encoding = "Encoding"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let encrypted = "Encrypted"
    /// Area: http; status - standard ref - [RFC7232, Section 2.3]
    public static let etag = "ETag"
    /// Area: http; status - standard ref - [RFC7231, Section 5.1.1]
    public static let expect = "Expect"
    /// Area: http; status - standard ref - [RFC-ietf-httpbis-expect-ct-08]
    public static let expectCt = "Expect-CT"
    /// Area: http; status - standard ref - [RFC7234, Section 5.3]
    /// Area: mail; status - standard ref - [RFC4021]
    /// Area: netnews; status - standard ref - [RFC5536]
    public static let expires = "Expires"
    /// Area: mail; status -  ref - [RFC4021]
    public static let expiryDate = "Expiry-Date"
    /// Area: http; status - standard ref - [RFC4229]
    public static let ext = "Ext"
    /// Area: netnews; status - standard ref - [RFC5536]
    public static let followupTo = "Followup-To"
    /// Area: http; status -  ref - [RFC7239]
    public static let forwarded = "Forwarded"
    /// Area: http; status - standard ref - [RFC7231, Section 5.5.1]
    /// Area: mail; status - standard ref - [RFC5322][RFC6854]
    /// Area: netnews; status -  ref - [RFC5536][RFC5322]
    public static let from = "From"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let generateDeliveryReport = "Generate-Delivery-Report"
    /// Area: http; status - standard ref - [RFC4229]
    public static let getprofile = "GetProfile"
    /// Area: http; status -  ref - [RFC7486, Section 6.1.1]
    public static let hobareg = "Hobareg"
    /// Area: http; status -  ref - [RFC7230, Section 5.4]
    public static let host = "Host"
    /// Area: http; status - standard ref - [RFC7540, Section 3.2.1]
    public static let http2Settings = "HTTP2-Settings"
    /// Area: http; status -  ref - [RFC4229]
    public static let im = "IM"
    /// Area: http; status - deprecated ref - [RFC4918]
    public static let `if` = "If"
    /// Area: http; status - standard ref - [RFC7232, Section 3.1]
    public static let ifMatch = "If-Match"
    /// Area: http; status -  ref - [RFC7232, Section 3.3]
    public static let ifModifiedSince = "If-Modified-Since"
    /// Area: http; status -  ref - [RFC7232, Section 3.2]
    public static let ifNoneMatch = "If-None-Match"
    /// Area: http; status -  ref - [RFC7233, Section 3.2]
    public static let ifRange = "If-Range"
    /// Area: http; status -  ref - [RFC6638]
    public static let ifScheduleTagMatch = "If-Schedule-Tag-Match"
    /// Area: http; status -  ref - [RFC7232, Section 3.4]
    public static let ifUnmodifiedSince = "If-Unmodified-Since"
    /// Area: mail; status -  ref - [RFC4021]
    public static let importance = "Importance"
    /// Area: mail; status -  ref - [RFC5322]
    public static let inReplyTo = "In-Reply-To"
    /// Area: http; status - standard ref - [RFC8473]
    public static let includeReferredTokenBindingId = "Include-Referred-Token-Binding-ID"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let incompleteCopy = "Incomplete-Copy"
    /// Area: netnews; status - standard ref - [RFC5536]
    public static let injectionDate = "Injection-Date"
    /// Area: netnews; status -  ref - [RFC5536]
    public static let injectionInfo = "Injection-Info"
    /// Area: http; status - standard ref - [RFC4229]
    public static let keepAlive = "Keep-Alive"
    /// Area: mail; status - informational ref - [RFC5322]
    /// Area: netnews; status -  ref - [RFC5536][RFC5322]
    public static let keywords = "Keywords"
    /// Area: http; status - standard ref - [RFC4229]
    public static let label = "Label"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let language = "Language"
    /// Area: http; status -  ref - [RFC7232, Section 2.2]
    public static let lastModified = "Last-Modified"
    /// Area: mail; status -  ref - [RFC4021]
    public static let latestDeliveryTime = "Latest-Delivery-Time"
    /// Area: netnews; status - standard ref - [RFC5536][RFC3977]
    public static let lines = "Lines"
    /// Area: http; status -  ref - [RFC8288]
    public static let link = "Link"
    /// Area: mail; status -  ref - [RFC4021]
    public static let listArchive = "List-Archive"
    /// Area: mail; status -  ref - [RFC4021]
    public static let listHelp = "List-Help"
    /// Area: mail; status -  ref - [RFC4021]
    public static let listId = "List-ID"
    /// Area: mail; status -  ref - [RFC4021]
    public static let listOwner = "List-Owner"
    /// Area: mail; status -  ref - [RFC4021]
    public static let listPost = "List-Post"
    /// Area: mail; status -  ref - [RFC4021]
    public static let listSubscribe = "List-Subscribe"
    /// Area: mail; status -  ref - [RFC4021]
    public static let listUnsubscribe = "List-Unsubscribe"
    /// Area: mail; status -  ref - [RFC8058]
    public static let listUnsubscribePost = "List-Unsubscribe-Post"
    /// Area: http; status -  ref - [RFC7231, Section 7.1.2]
    public static let location = "Location"
    /// Area: http; status -  ref - [RFC4918]
    public static let lockToken = "Lock-Token"
    /// Area: http; status -  ref - [RFC4229]
    public static let man = "Man"
    /// Area: http; status -  ref - [RFC7231, Section 5.1.2]
    public static let maxForwards = "Max-Forwards"
    /// Area: http; status -  ref - [RFC7089]
    public static let mementoDatetime = "Memento-Datetime"
    /// Area: mail; status -  ref - [RFC4021]
    public static let messageContext = "Message-Context"
    /// Area: mail; status - standard ref - [RFC5322]
    /// Area: netnews; status -  ref - [RFC5536][RFC5322]
    public static let messageId = "Message-ID"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let messageType = "Message-Type"
    /// Area: http; status - obsoleted ref - [RFC4229]
    public static let meter = "Meter"
    /// Area: http; status - obsoleted ref - [RFC7231, Appendix A.1]
    /// Area: MIME; status -  ref - [RFC4021]
    public static let mimeVersion = "MIME-Version"
    /// Area: mail; status -  ref - [RFC6477][ACP123 Appendix A1.1 and Appendix B.105]
    public static let mmhsExemptedAddress = "MMHS-Exempted-Address"
    /// Area: mail; status - experimental ref - [RFC6477][ACP123 Appendix A1.2 and Appendix B.106]
    public static let mmhsExtendedAuthorisationInfo = "MMHS-Extended-Authorisation-Info"
    /// Area: mail; status - standard ref - [RFC6477][ACP123 Appendix A1.3 and Appendix B.107]
    public static let mmhsSubjectIndicatorCodes = "MMHS-Subject-Indicator-Codes"
    /// Area: mail; status - informational ref - [RFC6477][ACP123 Appendix A1.4 and Appendix B.108]
    public static let mmhsHandlingInstructions = "MMHS-Handling-Instructions"
    /// Area: mail; status - standard ref - [RFC6477][ACP123 Appendix A1.5 and Appendix B.109]
    public static let mmhsMessageInstructions = "MMHS-Message-Instructions"
    /// Area: mail; status - standard ref - [RFC6477][ACP123 Appendix A1.6 and Appendix B.110]
    public static let mmhsCodressMessageIndicator = "MMHS-Codress-Message-Indicator"
    /// Area: mail; status -  ref - [RFC6477][ACP123 Appendix A1.7 and Appendix B.111]
    public static let mmhsOriginatorReference = "MMHS-Originator-Reference"
    /// Area: mail; status - standard ref - [RFC6477][ACP123 Appendix A1.8 and Appendix B.101]
    public static let mmhsPrimaryPrecedence = "MMHS-Primary-Precedence"
    /// Area: mail; status -  ref - [RFC6477][ACP123 Appendix A1.9 and Appendix B.102]
    public static let mmhsCopyPrecedence = "MMHS-Copy-Precedence"
    /// Area: mail; status - standard ref - [RFC6477][ACP123 Appendix A1.10 and Appendix B.103]
    public static let mmhsMessageType = "MMHS-Message-Type"
    /// Area: mail; status - standard ref - [RFC6477][ACP123 Appendix A1.12 and Appendix B.113]
    public static let mmhsOtherRecipientsIndicatorTo = "MMHS-Other-Recipients-Indicator-To"
    /// Area: mail; status -  ref - [RFC6477][ACP123 Appendix A1.12 and Appendix B.113]
    public static let mmhsOtherRecipientsIndicatorCc = "MMHS-Other-Recipients-Indicator-CC"
    /// Area: mail; status - standard ref - [RFC6477][ACP123 Appendix A1.14 and Appendix B.116]
    public static let mmhsAcp127MessageIdentifier = "MMHS-Acp127-Message-Identifier"
    /// Area: mail; status - standard ref - [RFC6477][ACP123 Appendix A1.15 and Appendix B.117]
    public static let mmhsOriginatorPlad = "MMHS-Originator-PLAD"
    /// Area: mail; status - standard ref - [RFC6758]
    public static let mtPriority = "MT-Priority"
    /// Area: http; status -  ref - [RFC4229]
    public static let negotiate = "Negotiate"
    /// Area: netnews; status - standard ref - [RFC5536]
    public static let newsgroups = "Newsgroups"
    /// Area: netnews; status -  ref - [RFC5536]
    public static let nntpPostingDate = "NNTP-Posting-Date"
    /// Area: netnews; status -  ref - [RFC2980][RFC5536]
    public static let nntpPostingHost = "NNTP-Posting-Host"
    /// Area: mail; status -  ref - [RFC4021]
    public static let obsoletes = "Obsoletes"
    /// Area: http; status -  ref - [RFC4229]
    public static let opt = "Opt"
    /// Area: http; status - standard ref - [RFC8053, Section 3]
    public static let optionalWwwAuthenticate = "Optional-WWW-Authenticate"
    /// Area: http; status - obsoleted ref - [RFC4229]
    public static let orderingType = "Ordering-Type"
    /// Area: mail; status - standard ref - [RFC7681]
    /// Area: netnews; status - standard ref - [RFC5536]
    public static let organization = "Organization"
    /// Area: http; status - standard ref - [RFC6454]
    public static let origin = "Origin"
    /// Area: mail; status -  ref - [RFC4021]
    public static let originalEncodedInformationTypes = "Original-Encoded-Information-Types"
    /// Area: mail; status -  ref - [RFC5703]
    public static let originalFrom = "Original-From"
    /// Area: mail; status -  ref - [RFC4021]
    public static let originalMessageId = "Original-Message-ID"
    /// Area: mail; status -  ref - [RFC3798][RFC5337]
    public static let originalRecipient = "Original-Recipient"
    /// Area: netnews; status -  ref - [RFC5537]
    public static let originalSender = "Original-Sender"
    /// Area: mail; status -  ref - [RFC4021]
    public static let originatorReturnAddress = "Originator-Return-Address"
    /// Area: mail; status -  ref - [RFC5703]
    public static let originalSubject = "Original-Subject"
    /// Area: http; status - standard ref - [RFC8613, Section 11.1]
    public static let oscore = "OSCORE"
    /// Area: http; status - standard ref - [RFC4918]
    public static let overwrite = "Overwrite"
    /// Area: http; status - standard ref - [RFC4229]
    public static let p3P = "P3P"
    /// Area: netnews; status -  ref - [RFC5536]
    public static let path = "Path"
    /// Area: http; status -  ref - [RFC4229]
    public static let pep = "PEP"
    /// Area: http; status -  ref - [RFC4229]
    /// Area: mail; status - standard ref - [RFC4021]
    public static let picsLabel = "PICS-Label"
    /// Area: http; status - standard ref - [RFC4229]
    public static let pepInfo = "Pep-Info"
    /// Area: http; status - standard ref - [RFC4229]
    public static let position = "Position"
    /// Area: netnews; status - standard ref - [RFC0850][RFC5536]
    public static let postingVersion = "Posting-Version"
    /// Area: http; status - standard ref - [RFC7234, Section 5.4]
    public static let pragma = "Pragma"
    /// Area: http; status -  ref - [RFC7240]
    public static let prefer = "Prefer"
    /// Area: http; status - standard ref - [RFC7240]
    public static let preferenceApplied = "Preference-Applied"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let preventNondeliveryReport = "Prevent-NonDelivery-Report"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let priority = "Priority"
    /// Area: http; status - obsoleted ref - [RFC4229]
    public static let profileobject = "ProfileObject"
    /// Area: http; status - standard ref - [RFC4229]
    public static let `protocol` = "Protocol"
    /// Area: http; status -  ref - [RFC4229]
    public static let protocolInfo = "Protocol-Info"
    /// Area: http; status - standard ref - [RFC4229]
    public static let protocolQuery = "Protocol-Query"
    /// Area: http; status - standard ref - [RFC4229]
    public static let protocolRequest = "Protocol-Request"
    /// Area: http; status - standard ref - [RFC7235, Section 4.3]
    public static let proxyAuthenticate = "Proxy-Authenticate"
    /// Area: http; status - standard ref - [RFC7615, Section 4]
    public static let proxyAuthenticationInfo = "Proxy-Authentication-Info"
    /// Area: http; status - standard ref - [RFC7235, Section 4.4]
    public static let proxyAuthorization = "Proxy-Authorization"
    /// Area: http; status - standard ref - [RFC4229]
    public static let proxyFeatures = "Proxy-Features"
    /// Area: http; status - standard ref - [RFC4229]
    public static let proxyInstruction = "Proxy-Instruction"
    /// Area: http; status - standard ref - [RFC4229]
    public static let `public` = "Public"
    /// Area: http; status - obsoleted ref - [RFC7469]
    public static let publicKeyPins = "Public-Key-Pins"
    /// Area: http; status - standard ref - [RFC7469]
    public static let publicKeyPinsReportOnly = "Public-Key-Pins-Report-Only"
    /// Area: http; status - standard ref - [RFC7233, Section 3.1]
    public static let range = "Range"
    /// Area: mail; status - standard ref - [RFC5322][RFC5321]
    public static let received = "Received"
    /// Area: mail; status - standard ref - [RFC7208]
    public static let receivedSpf = "Received-SPF"
    /// Area: http; status -  ref - [RFC4437]
    public static let redirectRef = "Redirect-Ref"
    /// Area: mail; status - standard ref - [RFC5322]
    /// Area: netnews; status - standard ref - [RFC5536][RFC5322]
    public static let references = "References"
    /// Area: http; status - standard ref - [RFC7231, Section 5.5.2]
    public static let referer = "Referer"
    /// Area: netnews; status - standard ref - [RFC0850][RFC5536]
    public static let relayVersion = "Relay-Version"
    /// Area: http; status - standard ref - [RFC8555, Section 6.5.1]
    public static let replayNonce = "Replay-Nonce"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let replyBy = "Reply-By"
    /// Area: mail; status - standard ref - [RFC5322]
    /// Area: netnews; status - standard ref - [RFC5536][RFC5322]
    public static let replyTo = "Reply-To"
    /// Area: mail; status -  ref - [RFC7293]
    public static let requireRecipientValidSince = "Require-Recipient-Valid-Since"
    /// Area: mail; status - obsoleted ref - [RFC5322]
    public static let resentBcc = "Resent-Bcc"
    /// Area: mail; status - standard ref - [RFC5322]
    public static let resentCc = "Resent-Cc"
    /// Area: mail; status - standard ref - [RFC5322]
    public static let resentDate = "Resent-Date"
    /// Area: mail; status -  ref - [RFC5322][RFC6854]
    public static let resentFrom = "Resent-From"
    /// Area: mail; status - standard ref - [RFC5322]
    public static let resentMessageId = "Resent-Message-ID"
    /// Area: mail; status - standard ref - [RFC5322]
    public static let resentReplyTo = "Resent-Reply-To"
    /// Area: mail; status - obsoleted ref - [RFC5322][RFC6854]
    public static let resentSender = "Resent-Sender"
    /// Area: mail; status -  ref - [RFC5322]
    public static let resentTo = "Resent-To"
    /// Area: http; status - standard ref - [RFC7231, Section 7.1.3]
    public static let retryAfter = "Retry-After"
    /// Area: mail; status -  ref - [RFC5322]
    public static let returnPath = "Return-Path"
    /// Area: http; status -  ref - [RFC4229]
    public static let safe = "Safe"
    /// Area: http; status -  ref - [RFC6638]
    public static let scheduleReply = "Schedule-Reply"
    /// Area: http; status - standard ref - [RFC6638]
    public static let scheduleTag = "Schedule-Tag"
    /// Area: http; status - standard ref - [RFC8473]
    public static let secTokenBinding = "Sec-Token-Binding"
    /// Area: http; status - standard ref - [RFC6455]
    public static let secWebsocketAccept = "Sec-WebSocket-Accept"
    /// Area: http; status - standard ref - [RFC6455]
    public static let secWebsocketExtensions = "Sec-WebSocket-Extensions"
    /// Area: http; status - informational ref - [RFC6455]
    public static let secWebsocketKey = "Sec-WebSocket-Key"
    /// Area: http; status -  ref - [RFC6455]
    public static let secWebsocketProtocol = "Sec-WebSocket-Protocol"
    /// Area: http; status - standard ref - [RFC6455]
    public static let secWebsocketVersion = "Sec-WebSocket-Version"
    /// Area: http; status -  ref - [RFC4229]
    public static let securityScheme = "Security-Scheme"
    /// Area: netnews; status -  ref - [RFC1849][RFC5536]
    public static let seeAlso = "See-Also"
    /// Area: mail; status -  ref - [RFC5322][RFC6854]
    /// Area: netnews; status - standard ref - [RFC5536][RFC5322]
    public static let sender = "Sender"
    /// Area: mail; status - standard ref - [RFC4021]
    public static let sensitivity = "Sensitivity"
    /// Area: http; status - standard ref - [RFC7231, Section 7.4.2]
    public static let server = "Server"
    /// Area: http; status - standard ref - [RFC6265]
    public static let setCookie = "Set-Cookie"
    /// Area: http; status - standard ref - [RFC2965][RFC6265]
    public static let setCookie2 = "Set-Cookie2"
    /// Area: http; status - standard ref - [RFC4229]
    public static let setprofile = "SetProfile"
    /// Area: http; status - standard ref - [RFC5023]
    public static let slug = "SLUG"
    /// Area: http; status - standard ref - [RFC4229]
    public static let soapaction = "SoapAction"
    /// Area: mail; status - standard ref - [RFC3865]
    public static let solicitation = "Solicitation"
    /// Area: http; status - standard ref - [RFC4229]
    public static let statusUri = "Status-URI"
    /// Area: http; status - standard ref - [RFC6797]
    public static let strictTransportSecurity = "Strict-Transport-Security"
    /// Area: mail; status -  ref - [RFC5322]
    /// Area: netnews; status - standard ref - [RFC5536][RFC5322]
    public static let subject = "Subject"
    /// Area: netnews; status - standard ref - [RFC5536]
    public static let summary = "Summary"
    /// Area: http; status - standard ref - [RFC8594]
    public static let sunset = "Sunset"
    /// Area: mail; status -  ref - [RFC4021]
    /// Area: netnews; status - standard ref - [RFC5536][RFC2156]
    public static let supersedes = "Supersedes"
    /// Area: http; status - standard ref - [RFC4229]
    public static let surrogateCapability = "Surrogate-Capability"
    /// Area: http; status - standard ref - [RFC4229]
    public static let surrogateControl = "Surrogate-Control"
    /// Area: http; status - standard ref - [RFC4229]
    public static let tcn = "TCN"
    /// Area: http; status -  ref - [RFC7230, Section 4.3]
    public static let te = "TE"
    /// Area: http; status - standard ref - [RFC4918]
    public static let timeout = "Timeout"
    /// Area: mail; status -  ref - [RFC8460]
    public static let tlsReportDomain = "TLS-Report-Domain"
    /// Area: mail; status -  ref - [RFC8460]
    public static let tlsReportSubmitter = "TLS-Report-Submitter"
    /// Area: mail; status -  ref - [RFC8689]
    public static let tlsRequired = "TLS-Required"
    /// Area: mail; status -  ref - [RFC5322]
    public static let to = "To"
    /// Area: http; status -  ref - [RFC8030, Section 5.4]
    public static let topic = "Topic"
    /// Area: http; status -  ref - [RFC7230, Section 4.4]
    public static let trailer = "Trailer"
    /// Area: http; status -  ref - [RFC7230, Section 3.3.1]
    public static let transferEncoding = "Transfer-Encoding"
    /// Area: http; status -  ref - [RFC8030, Section 5.2]
    public static let ttl = "TTL"
    /// Area: http; status - standard ref - [RFC8030, Section 5.3]
    public static let urgency = "Urgency"
    /// Area: http; status - informational ref - [RFC4229]
    public static let uri = "URI"
    /// Area: http; status - standard ref - [RFC7230, Section 6.7]
    public static let upgrade = "Upgrade"
    /// Area: http; status -  ref - [RFC7231, Section 5.5.3]
    /// Area: netnews; status -  ref - [RFC5536][RFC2616]
    public static let userAgent = "User-Agent"
    /// Area: http; status -  ref - [RFC4229]
    public static let variantVary = "Variant-Vary"
    /// Area: http; status -  ref - [RFC7231, Section 7.1.4]
    public static let vary = "Vary"
    /// Area: mail; status -  ref - [RFC5518]
    public static let vbrInfo = "VBR-Info"
    /// Area: http; status -  ref - [RFC7230, Section 5.7.1]
    public static let via = "Via"
    /// Area: http; status -  ref - [RFC7235, Section 4.1]
    public static let wwwAuthenticate = "WWW-Authenticate"
    /// Area: http; status -  ref - [RFC4229]
    public static let wantDigest = "Want-Digest"
    /// Area: http; status -  ref - [RFC7234, Section 5.5]
    public static let warning = "Warning"
    /// Area: mail; status -  ref - [RFC4021]
    public static let x400ContentIdentifier = "X400-Content-Identifier"
    /// Area: mail; status -  ref - [RFC4021]
    public static let x400ContentReturn = "X400-Content-Return"
    /// Area: mail; status -  ref - [RFC4021]
    public static let x400ContentType = "X400-Content-Type"
    /// Area: mail; status -  ref - [RFC4021]
    public static let x400MtsIdentifier = "X400-MTS-Identifier"
    /// Area: mail; status -  ref - [RFC4021]
    public static let x400Originator = "X400-Originator"
    /// Area: mail; status -  ref - [RFC4021]
    public static let x400Received = "X400-Received"
    /// Area: mail; status -  ref - [RFC4021]
    public static let x400Recipients = "X400-Recipients"
    /// Area: mail; status -  ref - [RFC4021]
    public static let x400Trace = "X400-Trace"
    /// Area: http; status -  ref - [https://fetch.spec.whatwg.org/#x-content-type-options-header]
    public static let xContentTypeOptions = "X-Content-Type-Options"
    /// Area: http; status -  ref - [RFC7034]
    public static let xFrameOptions = "X-Frame-Options"
    /// Area: netnews; status -  ref - [RFC5536]
    public static let xref = "Xref"

    /// Indicate api version
    public static let xApiVersion = "X-Api-Version"
  }
}
