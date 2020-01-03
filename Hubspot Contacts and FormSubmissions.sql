#Query for Contacts and Form Submissions
SELECT   FormSubmission.formId
	,FormSubmission.formTitle as "Form Title"
	,FormSubmission.pageTitle as "Page Title"
	,FormSubmission.value_recent_interaction as "FS Recent Interaction"
	,FormSubmission.pageUrl as "Page URL"
	,if(FormSubmission.timestamp<>'',from_unixtime(floor(FormSubmission.Timestamp/1000)),null) as "Form Submission Date"
	,Contact.emailAddress as "HS Email"
	,Contact.profileUrl as "HS Profile URL"
        ,Contact.contactProperty_state as "HS State"
	,Contact.contactProperty_campaign
	,Contact.contactProperty_company as "HS Company"
	,Contact.contactProperty_country as "HS Country"
	,substring(Contact.emailAddress, position("@" in Contact.emailAddress)+1,length(Contact.emailAddress)) as "HS Email Domain"
	,if(Contact.contactProperty_createdate<>'',from_unixtime(floor(Contact.contactProperty_createdate/1000)),null) as "HS Create Date"
	,Contact.contactProperty_hs_analytics_source_data_1 as "Original Source Type 1"
	,Contact.contactProperty_hs_analytics_source_data_2 as "Original Source Type 2"
	,Contact.contactProperty_industry as "HS Industry"
	,Contact.contactProperty_job_role__c as "HS Job Role"
	,Contact.contactProperty_lifecyclestage as "Lifecycle Stage"
	,if(Contact.contactProperty_hs_lifecyclestage_lead_date<>'',from_unixtime(floor(Contact.contactProperty_hs_lifecyclestage_lead_date/1000)),null) AS "Lifecycle Lead Date"
	,Contact.contactProperty_explicit_interest_analytics_cloud as "Interest in Analytics Cloud"
	,Contact.contactProperty_explicit_interest_commerce as "Interest in Commerce"
	,Contact.contactProperty_explicit_interest_dxp as "Interest in DXP"
	,Contact.contactProperty_region__c as "HS Region"
	,Contact.contactProperty_salesforceaccountid as "Salesforce Account ID"
	,Contact.contactProperty_salesforcecontactid as "Salesforce Contact ID"
	,Contact.contactProperty_salesforceleadid as "Salesforce Lead ID"
        ,Contact.contactProperty_first_conversion_event_name as "HS First Conversion"
        ,Contact.contactProperty_first_conversion_type as "HS First Conversion Type"
        ,Contact.contactProperty_first_interaction as "HS First Interaction"
        ,Contact.contactProperty_first_interaction_type as "HS First Interaction Type"
        ,Contact.contactProperty_recent_conversion_event_name as "HS Recent Conversion"
        ,Contact.contactProperty_recent_conversion_source as "HS Recent Conversion Source"
        ,Contact.contactProperty_recent_interaction as "HS Recent Interaction"
	,Contact.contactProperty_marketing_territory as "HS Marketing Territory"
        ,if(Contact.contactProperty_first_conversion_date<>'',from_unixtime(floor(Contact.contactProperty_first_conversion_date/1000)),null) as "HS First Conversion Date"
        ,if(Contact.contactProperty_first_interaction_date<>'',from_unixtime(floor(Contact.contactProperty_first_interaction_date/1000)),null) as "HS First Interaction Date"
        ,if(Contact.contactProperty_recent_conversion_date<>'',from_unixtime(floor(Contact.contactProperty_recent_conversion_date/1000)),null) as "HS Recent Conversion Date"
        ,if(Contact.contactProperty_recent_interaction_date<>'',from_unixtime(floor(Contact.contactProperty_recent_interaction_date/1000)),null) as "HS Recent Interaction Date"
	,Contact.contactProperty_i_work_for_a_development_firm_agency_or_partner as "I work for a development firm agency or partner"
        ,CASE
		WHEN Contact.contactProperty_hs_analytics_source = "DIRECT_TRAFFIC" THEN "Direct Traffic"
		WHEN Contact.contactProperty_hs_analytics_source = "EMAIL_MARKETING" THEN "Email Marketing"
		WHEN Contact.contactProperty_hs_analytics_source = "ORGANIC_SEARCH" THEN "Organic Search"
		WHEN Contact.contactProperty_hs_analytics_source = "SOCIAL_MEDIA" THEN "Social Media"
		WHEN Contact.contactProperty_hs_analytics_source = "REFERRALS" THEN "Referrals"
		WHEN Contact.contactProperty_hs_analytics_source = "OFFLINE" THEN "Offline"
		WHEN Contact.contactProperty_hs_analytics_source = "PAID_SEARCH" THEN "Paid Search"
		WHEN Contact.contactProperty_hs_analytics_source = "OTHER_CAMPAIGNS" THEN "Other Campaigns"
		WHEN Contact.contactProperty_hs_analytics_source = "PAID_SOCIAL" THEN "Paid Social"
		ELSE "Other"
		END AS "Original Source Type"

        # BDR Properties
        ,contactProperty_marketing_owner as "Marketing Owner"
        ,CASE 	
        	WHEN contactProperty_hubspot_owner_id = '36469682' then "David Aulie"
		WHEN contactProperty_hubspot_owner_id = '454' then "Emy Hui"
		WHEN contactProperty_hubspot_owner_id = '32108193' then "Krista Curtis"
		WHEN contactProperty_hubspot_owner_id = '36230948' then "Micah Gilmore"
                WHEN contactProperty_hubspot_owner_id = '39511481' then "Jacob Kim"
                WHEN contactProperty_hubspot_owner_id = '40331173' then "Aaron Bradley"
		else contactProperty_hubspot_owner_id
		end as "Contact Owner Name"		#retrieved hubspot owner id from properties tab in hubspot. searched for their names.
	,Contact.contactProperty_outreach_contact as "Outreach Contact"
        ,Contact.contactProperty_hubspot_team_id as "Hubspot Team Id"
        ,Contact.contactProperty_leadstatus as "HS (SF) Lead Status"
        ,Contact.contactProperty_lead_status_detail__c as "HS (SF) Lead Status Detail"
        ,if(Contact.contactProperty_first_autoqual_formsubmission_date<>'',from_unixtime(floor(Contact.contactProperty_first_autoqual_formsubmission_date/1000)),null) AS "First Autoqualification FormSubmission Date" #indicates date that they would have become an automatic mql
        ,if(Contact.contactProperty_first_scoring_threshold_date<>'',from_unixtime(floor(Contact.contactProperty_first_scoring_threshold_date/1000)),null) AS "First Scoring Threshold Date" #indicates the first date they would have become a Scoring lead
	,if(Contact.contactProperty_attempting_to_contact_date<>'',from_unixtime(floor(Contact.contactProperty_attempting_to_contact_date/1000)),null) AS "Attempting to Contact Date"
	,if(Contact.contactProperty_attempting_to_qualify_date<>'',from_unixtime(floor(Contact.contactProperty_attempting_to_qualify_date/1000)),null) AS "Attempting to Qualify Date"
	,if(Contact.contactProperty_discovery_call_date<>'',from_unixtime(floor(Contact.contactProperty_discovery_call_date/1000)),null) AS "Discovery Call Date"
	,if(Contact.contactProperty_in_conversation_date<>'',from_unixtime(floor(Contact.contactProperty_in_conversation_date/1000)),null) AS "In Conversation Date"
	,if(Contact.contactProperty_prospect_date<>'',from_unixtime(floor(Contact.contactProperty_prospect_date/1000)),null) AS "Prospect Date"
	,if(Contact.contactProperty_suspect_date<>'',from_unixtime(floor(Contact.contactProperty_suspect_date/1000)),null) AS "Suspect Date"
	,if(Contact.contactProperty_prospect_rejected_date<>'',from_unixtime(floor(Contact.contactProperty_prospect_rejected_date/1000)),null) AS "Prospect Rejected Date"
	,if(Contact.contactProperty_no_contact_made_month_1_date<>'',from_unixtime(floor(Contact.contactProperty_no_contact_made_month_1_date/1000)),null) AS "No Contact Made - Month 1"
	,if(Contact.contactProperty_no_contact_made_month_2_date<>'',from_unixtime(floor(Contact.contactProperty_no_contact_made_month_2_date/1000)),null) AS "No Contact Made - Month 2"
	,if(Contact.contactProperty_no_contact_made_month_3_date<>'',from_unixtime(floor(Contact.contactProperty_no_contact_made_month_3_date/1000)),null) AS "No Contact Made - Month 3"

	# Funnel Stage Properties
        ,Contact.contactProperty_aqp_reason as "AQP Reason"
        ,Contact.contactProperty_aqp_reason_detail as "AQP Reason Detail"
        ,Contact.contactProperty_aqp_score as "AQP Score"
        ,Contact.contactProperty_c_f_implicit_score as "Calculated field implicit score"
        ,Contact.contactProperty_email_open_d_s_d as "Email open diminishing score date"
        ,Contact.contactProperty_email_open_s_c as "Email open scoring counter"
        ,Contact.contactProperty_email_open_s_p as "Email open scoring points"
        ,Contact.contactProperty_form_submission_d_s_d as "Form submission diminshing score date"
        ,Contact.contactProperty_form_submission_s_c as "Form submission scoring counter"
        ,Contact.contactProperty_form_submission_s_p as "Form submission scoring points"
        ,Contact.contactProperty_page_view_d_s_d as "Page view diminishing score date"
        ,Contact.contactProperty_page_view_s_c as "Page view scoring counter"
        ,Contact.contactProperty_page_view_s_p as "Page view scoring points"
        ,Contact.contactProperty_funnel_stage as "Contact Funnel Stage"
        ,if(Contact.contactProperty_fs_aqp_date<>'',from_unixtime(floor(Contact.contactProperty_fs_aqp_date/1000)),null) as "Funnel stage aqp date"
        ,if(Contact.contactProperty_fs_inquiry_date<>'',from_unixtime(floor(Contact.contactProperty_fs_inquiry_date/1000)),null) as "Funnel stage inquiry date"
        ,if(Contact.contactProperty_fs_known_prospect_date<>'',from_unixtime(floor(Contact.contactProperty_fs_known_prospect_date/1000)),null) as "Funnel stage prospect date"
        ,if(Contact.contactProperty_fs_map_date<>'',from_unixtime(floor(Contact.contactProperty_fs_map_date/1000)),null) as "Funnel stage map date"
        ,if(Contact.contactProperty_fs_mql_date<>'',from_unixtime(floor(Contact.contactProperty_fs_mql_date/1000)),null) as "Funnel stage mql date"
        ,if(Contact.ContactProperty_fs_sao_date<>'',from_unixtime(floor(Contact.contactProperty_fs_sao_date/1000)),null) as "Funnel stage sao date"
        ,if(Contact.contactProperty_fs_sqo_date<>'',from_unixtime(floor(Contact.contactProperty_fs_sqo_date/1000)),null) as "Funnel stage sqo date"
        ,if(Contact.contactProperty_fs_cwo_date<>'',from_unixtime(floor(Contact.contactProperty_fs_cwo_date/1000)),null) as "Funnel stage cwo date"

        # Partner Properties 
        ,Contact.contactProperty_mdf_prospect as "MDF Prospect" #if true, they came from a partner.
	,if(Contact.contactProperty_partner_lead_submit_date<>'',from_unixtime(floor(Contact.contactProperty_partner_lead_submit_date/1000)),null) as "Partner Lead Submit Date"
	,Contact.contactProperty_partner_name as "Partner Name"
	,Contact.contactProperty_partner_program as "Partner Program"
	,Contact.contactProperty_partner_program_city as "Partner Program City"
	,Contact.contactProperty_partner_program_date as "Partner Program Date"
	,Contact.contactProperty_partner_program_type as "Partner Program Type"
FROM Contact
LEFT JOIN FormSubmission
	ON Contact.emailAddress = FormSubmission.value_email
WHERE substring(Contact.emailAddress, position("@" in Contact.emailAddress)+1,length(Contact.emailAddress)) <> 'liferay.com'