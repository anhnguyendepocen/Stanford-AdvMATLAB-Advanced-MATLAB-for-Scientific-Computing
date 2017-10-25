function val = GPA(courses_struct)
    val = sum([courses_struct(:).gpa_units].*[courses_struct(:).gpa_credits])/sum([courses_struct(:).gpa_units]);
end