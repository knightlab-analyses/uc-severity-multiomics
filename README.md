# uc-severity-multiomics
<b>ABSTRACT:</b> Ulcerative colitis (UC) is driven by disturbed host-microbiota relations, but current treatments exclusively target host inflammatory pathways1-3. To understand how host-microbiota interactions go awry in UC, we collected and analyzed six fecal or serum based –omic datasets from 40 UC patient samples displaying varying clinical, endoscopic, and histologic disease activity. A validation cohort of 210 samples (73 UC, 117 Crohn’s disease (CD), 20 healthy controls) was collected and analyzed separately and independently. Data integration across both cohorts showed that a subset of the clinically active UC patients had an over-abundance of proteases that originated from the bacterium, Bacteroides vulgatus. To test the hypothesis that B. vulgatus proteases contribute to UC disease activity, we first profiled B. vulgatus proteases and then selected an appropriate broad-spectrum protease inhibitor to evaluate their involvement in colitis models. Protease inhibition improved B. vulgatus-induced barrier dysfunction in vitro, and prevented colitis in B. vulgatus IL10 deficient monocolonized mice. Furthermore, transplantation of feces from UC patients with over-abundant B. vulgatus proteases into germ-free mice induced colitis dependent on protease activity. Together, these results stemming from a multi-omics approach, improve understanding of functional alterations in microbiota that drive UC and suggest inhibition of B. vulgatus proteases as a novel strategy to treat this disease.

# Instructions on data access
<b> Cohort 1 (40 UC patients) Raw Data files </b>
- For raw metaproteomics, serum proteomics and fecal metabolomics data. Go to ftp://massive.ucsd.edu/MSV000082094/.
  - Serum proteomics TMT-10plex raw files are under 2019-01-10_rhmills_f201638b/raw.  Data is structured with a UCS_X_Y format where X indicates TMT-10plex experiment and Y indicates the fraction. Sample layout for each TMT-10plex experiment can be found here (ftp://massive.ucsd.edu/MSV000086509/updates/2021-09-01_rhmills_317bd0da/other/UCS_Label_Scheme.xlsx).
  - Fecal metabolomics raw files are under 2019-01-10_rhmills_712042dc/raw.
  - Fecal metaproteomics TMT-10plex raw files are under the raw directory. Data is structured with a UC_X_Y format where X indicates TMT-10plex experiment and Y indicates the fraction. Sample layout for each TMT-10plex experiment can be found here (ftp://massive.ucsd.edu/MSV000086509/updates/2021-09-01_rhmills_317bd0da/other/UC_MP_Labeling_Scheme.xlsx).
- For raw sequencing data go to https://www.ebi.ac.uk/ena/browser/view/PRJEB42151

<b> Cohort 2 (>200 IBD and control patients) Raw Data files </b>
 - Fecal metabolomics raw files are at ftp://massive.ucsd.edu/MSV000084908/.
 - Fecal metaproteomics TMT-10plex raw files are at ftp://massive.ucsd.edu/MSV000086509. Data is structured with a IBD_EX_YY format where EX indicates TMT-10plex experiment and YY indicates the fraction. Sample layout for each TMT-10plex experiment can be found here (ftp://massive.ucsd.edu/MSV000086509/updates/2021-09-01_rhmills_317bd0da/other/IBD200_label_layout.csv).
- For raw sequencing data go to https://www.ebi.ac.uk/ena/browser/view/PRJEB42155

<b> Processed data tables </b>
- For mass spec datasets: Go to ftp://massive.ucsd.edu/MSV000086509/updates/2021-09-01_rhmills_317bd0da/other
- Deidentified patient metadata: UC_MP_Emperor_Map.txt (Cohort 1) & Combined_Metadata_Allomics_MP_V1.txt (Cohort 2)
  - Metabolomics data: UC40_MB_Table_normalized.txt (Cohort 1) & MB_Standardized_Table_Normalized_Final.txt(Cohort 2)
  - Metabolomics annotations: UC40_MB_Annotations.txt (Cohort 1) & Qemistree_IDs.txt (Cohort 2)
  - Metaproteomics data: NormalizedDataAll.txt (Cohort 1) & All_proteins_normalized_MGDBFinal (Cohort 2)
  - Metaproteomics annotations: UC40_Full_Protein_Annotations_All_hitsV2 (Cohort 1) & MGDB_Full_Protein_Annotations_AllProteomic_hits2.csv (Cohort 2)
- For sequencing datasets: Go to ftp://massive.ucsd.edu/MSV000086509/updates/2021-09-01_rhmills_3fdb238f/other
  - Metagenomic data processed into OGUs (https://github.com/qiyunzhu/woltka): gOTU_table_UC40_2.txt (Cohort 1) & MetaG_gOTU_table.txt (Cohort 2)
  - 16S data at level 7 taxonomy: UC_40_level-7.csv (Cohort 1) & level-7-nothaw.csv (Cohort 2)
- For processed serum proteomics (Cohort 1):
  - https://massive.ucsd.edu/ProteoSAFe/DownloadResultFile?file=f.MSV000086509/updates/2023-07-25_rhmills_ca50cd24/other/Serum_NormalizedDataAll.csv&forceDownload=true
  - https://massive.ucsd.edu/ProteoSAFe/DownloadResultFile?file=f.MSV000086509/updates/2023-07-25_rhmills_ca50cd24/other/All_uniprot_annotations.txt&forceDownload=true
    
<i> For use case examples see the python notebook files (.ipynb) files here </i>

Additional files can be made available upon request.
