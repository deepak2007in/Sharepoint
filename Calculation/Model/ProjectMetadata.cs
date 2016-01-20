using System;
using System.Collections.Generic;

namespace SCI.CIProject.ProjectSaving
{
    public class ProjectMetadata
    {
        public ProjectType ProjectType { get; set; }
        public bool LeanBenifits { get; set; }
        public ProjectTimeline ProjectTimeline { get; set; }
        public ProjectCost ProjectCost { get; private set; }
        public ProjectMetadata(DateTime implementationDate, int period)
        {
            
        }

        public void Populate(IDictionary<string, ProjectCostEntry> CostEntries)
        {

        }
    }
}